/*
 * Copyright 2016 C. Brett Witherspoon
 *
 * See LICENSE for more details.
 */

/**
 * Package: axi4
 *
 * A package for ARM AMBA AXI4 definitions.
 */
`default_nettype none

package axi4;

    /* typedef enum logic [2:0] {
        AXI4,
        ACE,
        ACE_LITE
    } prot_t;

    typedef enum logic [1:0] {
        OKAY,
        EXOKAY,
        SLVERR,
        DECERR
    } resp_t; */

    typedef logic [2:0] prot_t;
    typedef logic [1:0] resp_t;

endpackage : axi4


