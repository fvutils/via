`include "uvm_macros.svh"

package via_uvm;
  import uvm_pkg::*;
  import via::*;

  `include "via_uvm_component.svh"
  `include "via_uvm_extension_component.svh"

  via_uvm_extension_component __extension = new("via_uvm_extension", uvm_root::get()); 
endpackage
