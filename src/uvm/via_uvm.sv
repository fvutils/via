`include "uvm_macros.svh"

package via_uvm;
  import uvm_pkg::*;
  import via::*;

  typedef class via_uvm_object_type;
  via_uvm_object_type     m_obj_type_m[uvm_object_wrapper];

  `include "via_uvm_classtype_factory.svh"
  `include "via_uvm_component.svh"
  `include "via_uvm_extension_component.svh"
  `include "via_uvm_factory.svh"
  `include "via_uvm_object.svh"
  `include "via_uvm_object_type.svh"


  // Create the listener that is notified of UVM lifecycle events
  via_uvm_extension_component __extension = new(
    "via_uvm_extension",
    uvm_root::get()
  );

endpackage
