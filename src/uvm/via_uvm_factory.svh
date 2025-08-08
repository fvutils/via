
class via_uvm_factory extends uvm_factory implements via_factory_if;

    virtual function void get_type_names(ref string names[$]);
        void'(create_object_by_name("foo"));
//        foreach (m_type_names[i]) begin
//        end
//        if (m_type_names.exist("foo")) begin
//            $display("present");
//        end
    endfunction

endclass

