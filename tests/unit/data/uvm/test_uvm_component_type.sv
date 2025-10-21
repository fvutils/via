`include "uvm_macros.svh"

package uvm_component_type_pkg;
    import uvm_pkg::*;
    import via::*;

    class my_component extends uvm_component;
        `uvm_component_utils(my_component)

        function new(string name, uvm_component parent);
            super.new(name, parent);
        endfunction

    endclass

    class visitor extends via_visitor;
        int obj_count;
        int comp_count;

        virtual function void visit_object(via_object_if obj);
            obj_count++;
        endfunction

        virtual function void visit_component(via_component_if obj);
            comp_count++;
        endfunction

    endclass

endpackage

module test_uvm_component_type;
    import uvm_pkg::*;
    import via_uvm::*;
    import via::*;
    import uvm_component_type_pkg::*;

    initial begin
        automatic visitor v = new();
        automatic uvm_component comp = my_component::type_id::create("comp", null);
        automatic via_object_if obj = via_uvm_type_rgy::inst().create(comp);

        $display("obj: %0p", obj);
    end

endmodule


