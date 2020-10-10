module axi2apb #(parameter
  SLV_NUM  = 2,
  SLV_ADRW = 12,
  SLV_BASE = 32'h80000000,
  SLV_NUM_WID = $clog2(SLV_NUM),
  SLV_MASK = 32'hFFFFFFFF<<(SLV_ADRW+SLV_NUM_WID)
) (
  input wire aclk,
  input wire aresetn,
  axi.slave axi,
  apb.master apb[SLV_NUM]
);

reg [4:0] st_r, st_c;
localparam IDLE = 5'h1,  _IDLE_  = 0;
localparam WRITE= 5'h2,  _WRITE_ = 1;
localparam BRESP= 5'h4,  _BRESP_ = 2;
localparam READ = 5'h8,  _READ_  = 3;
localparam RDATA= 5'h10, _RDATA_ = 4;

reg [31:0] rdata_r, rdata_c;
wire apb_sel, apb_ready;
wire [SLV_NUM-1:0] psel, pready;
wire [32*SLV_NUM-1:0] prdata_perm;

assign axi.awready = st_r[_WRITE_]&apb_ready;
assign axi.wready = st_r[_WRITE_]&apb_ready;
assign axi.bvalid = st_r[_BRESP_];
assign axi.bresp = '0;
assign axi.arready = st_r[_READ_]&apb_ready;
assign axi.rvalid = st_r[_RDATA_];
assign axi.rresp = '0;
assign axi.rdata = rdata_r[31:0];

always_comb begin
  st_c[4:0] = st_r[4:0];
  unique case(st_r[4:0])
    IDLE: begin
      if (axi.awvalid) st_c[4:0] = WRITE;
      else if (axi.arvalid) st_c[4:0] = READ;
    end
    WRITE: if (axi.wvalid&apb_ready) st_c[4:0] = BRESP;
    BRESP: if (axi.bready) st_c[4:0] = IDLE;
    READ: st_c[4:0] = RDATA;
    RDATA: if (axi.rready) st_c[4:0] = IDLE;
  endcase
end

assign apb_sel = st_r[_WRITE_]&(((axi.awaddr^SLV_BASE)&SLV_MASK)=='0)
                |st_r[_READ_] &(((axi.araddr^SLV_BASE)&SLV_MASK)=='0);
assign apb_ready = |(psel[SLV_NUM-1:0]&pready[SLV_NUM-1:0]);

genvar s, t;
generate
for (s=0; s<SLV_NUM; s=s+1) begin: SLV
  assign apb[s].psel = apb_sel&(st_r[_WRITE_]&s[SLV_NUM_WID-1:0]==axi.awaddr[12+:SLV_NUM_WID]
                               |st_r[_READ_] &s[SLV_NUM_WID-1:0]==axi.araddr[12+:SLV_NUM_WID]);
  assign apb[s].penable = st_r[_WRITE_]&axi.wvalid|st_r[_READ_]&axi.arvalid;
  assign apb[s].paddr = st_r[_WRITE_] ? axi.awaddr[SLV_ADRW-1:0]:axi.araddr[SLV_ADRW-1:0];
  assign apb[s].pwrite = st_r[_WRITE_];
  assign apb[s].pwdata = axi.wdata;
  //assign apb[s].pslverr = '0;

  assign psel[s] = apb[s].psel;
  assign pready[s] = apb[s].pready;
  for (t=0; t<32; t=t+1) begin: PRDATA_BIT
    assign prdata_perm[t*SLV_NUM+s] = apb[s].prdata[t];
  end: PRDATA_BIT
end:SLV
endgenerate

integer b;
always_comb begin
  rdata_c[31:0] = rdata_r[31:0];
  if (|psel[SLV_NUM-1:0]&st_r[_READ_]&axi.arvalid)
    for (b=0; b<32; b=b+1) rdata_c[b] = |(psel[SLV_NUM-1:0]&prdata_perm[b*SLV_NUM+:SLV_NUM]);
end

always_ff @(posedge axi.aclk) begin
  if (!axi.aresetn) begin
    st_r[4:0] <= IDLE;
    rdata_r[31:0] <= '0;
  end else begin
    st_r[4:0] <= st_c[4:0];
    rdata_r[31:0] <= rdata_c[31:0];
  end
end

endmodule: axi2apb
