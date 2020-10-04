interface apb #(
  ADDR_WIDTH = 12,
  DATA_WIDTH = 32
)(
  input logic aclk,
  input logic aresetn
);
  logic                  psel;
  logic [ADDR_WIDTH-1:0] paddr;
  logic                  penable;
  logic                  pwrite;
  logic [DATA_WIDTH-1:0] pwdata;
  logic [DATA_WIDTH-1:0] prdata;
  logic                  pready;
  logic                  pslverr;

  modport master (
    input aclk,
    input aresetn,
    output psel,
    output paddr,
    output penable,
    output pwrite,
    output pwdata,
    input prdata,
    input pready,
    input pslverr
  );

  modport slave (
    input aclk,
    input aresetn,
    input psel,
    input paddr,
    input penable,
    input pwrite,
    input pwdata,
    output prdata,
    output pready,
    output pslverr
  );

  modport monitor (
    input aclk,
    input aresetn,
    input psel,
    input paddr,
    input penable,
    input pwrite,
    input pwdata,
    input prdata,
    input pready,
    input pslverr
  );

endinterface: apb
