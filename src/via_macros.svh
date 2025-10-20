
`ifndef INCLUDED_VIA_MACROS_SVH
`define INCLUDED_VIA_MACROS_SVH

`define VIA_FATAL(msg) \
    $write("VIA FATAL: "); \
    $display msg ; \
    $finish

`endif /* INCLUDED_VIA_MACROS_SVH */

