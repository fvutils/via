`include "uvm_macros.svh"
`include "test_utils_macros.svh"

package uvm_component_type_pkg;
    import uvm_pkg::*;
    import via::*;

    class my_component extends uvm_component;
        int a;
        `uvm_component_utils_begin(my_component)
        `uvm_field_int(a, UVM_ALL_ON)
        `uvm_component_utils_end

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
    import test_utils::*;
    import uvm_component_type_pkg::*;

    initial begin
        automatic visitor v = new();
        automatic uvm_component comp = my_component::type_id::create("comp", null);
        automatic via_object_if obj = via_uvm_type_rgy::inst().create(comp);
        automatic type_finder finder = new();
        automatic via_component_if comp_if;
        automatic via_field fields[$];

        `TEST_UTILS_ASSERT((obj != null));
        $display("obj.name: %0s", obj.get_name());
        `TEST_UTILS_ASSERT($cast(comp_if, obj));
        obj.get_object_type().get_fields(fields);
        `TEST_UTILS_ASSERT((fields.size() == 1));

        $display("obj.name: %0s", obj.get_name());
        
//        $display("obj: %0p", obj);

//        obj.accept(finder);

//        $display("%0d %0d", finder.objects.size(), finder.components.size());

//        uvm_factory::get().print();
        $finish;
    end

endmodule


