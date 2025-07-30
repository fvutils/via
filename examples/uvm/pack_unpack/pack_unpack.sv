`include "uvm_macros.svh"

package pack_unpack;
    import uvm_pkg::*;
    import via_uvm::*;

    class my_sequence_item extends uvm_sequence_item;
        // Fields with various widths
        rand bit [7:0]   field_a;    // 8-bit
        rand bit [15:0]  field_b;    // 16-bit
        rand bit [31:0]  field_c;    // 32-bit
        rand bit [3:0]   field_d;    // 4-bit
        rand bit [11:0]  field_e;    // 12-bit
        rand bit [23:0]  field_f;    // 24-bit
        rand bit [5:0]   field_g;    // 6-bit
        rand bit [19:0]  field_h;    // 20-bit
        rand bit [27:0]  field_i;    // 28-bit
        rand bit [9:0]   field_j;    // 10-bit

        `uvm_object_utils_begin(my_sequence_item)
            `uvm_field_int(field_a, UVM_DEFAULT)
            `uvm_field_int(field_b, UVM_DEFAULT)
            `uvm_field_int(field_c, UVM_DEFAULT)
            `uvm_field_int(field_d, UVM_DEFAULT)
            `uvm_field_int(field_e, UVM_DEFAULT)
            `uvm_field_int(field_f, UVM_DEFAULT)
            `uvm_field_int(field_g, UVM_DEFAULT)
            `uvm_field_int(field_h, UVM_DEFAULT)
            `uvm_field_int(field_i, UVM_DEFAULT)
            `uvm_field_int(field_j, UVM_DEFAULT)
        `uvm_object_utils_end

        function new(string name = "my_sequence_item");
            super.new(name);
        endfunction
    endclass

    class my_packer extends uvm_packer;

        virtual function void pack_field(uvm_bitstream_t value, int size);
            $display("pack_field %0d", size);
//            super.pack_field(value, size);
        endfunction

        virtual function void pack_field_int(uvm_integral_t value, int size);
            $display("pack_field_int %0d", size);
//            super.pack_field_int(value, size);
        endfunction

    endclass
endpackage

module top;
    import uvm_pkg::*;
    import via_uvm::*;
    import pack_unpack::*;

    initial begin
        automatic my_sequence_item src_item;
        automatic my_sequence_item dst_item;
        automatic my_packer packer = new();
        int success;

        // Create source and destination sequence items
        src_item = my_sequence_item::type_id::create("src_item");
        dst_item = my_sequence_item::type_id::create("dst_item");

        /*
        begin
            automatic via_uvm_classtype_factory f = new();
            void'(f.parse("type", src_item.sprint()));
        end
         */

//        void'(src_item.do_pack(packer));

        // Run pack/unpack test 100 times
        for (int i = 0; i < 1000000; i++) begin
            byte unsigned packed_bytes[];
            int unsigned packed_ints[];


            // Pack the item
            if (i == 0) begin
                int n_bits;
                // Randomize source item
                void'(src_item.randomize());
                n_bits = src_item.pack_bytes(packed_bytes);
                $display("n_bits: %0d %0d", n_bits, packed_bytes.size);
                n_bits = src_item.pack_ints(packed_ints);
                $display("n_bits: %0d %0d", n_bits, packed_ints.size);
            end

            // Unpack into destination item
            void'(dst_item.unpack_bytes(packed_bytes));

            // Compare items
            success = src_item.compare(dst_item);

            if (!success) begin
                $display("Error: Pack/unpack mismatch at iteration %0d", i);
                src_item.print();
                dst_item.print();
                $finish;
            end

            if (i == 999999) begin
                $display("Success: All 1000000 pack/unpack operations completed successfully");
            end
        end

        $finish;
    end

endmodule
