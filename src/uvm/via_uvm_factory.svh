
class via_uvm_factory extends uvm_default_factory implements via_factory_if;
    uvm_factory     m_core;

    function new(uvm_factory core);
        m_core = core;
    endfunction

    virtual function void get_type_names(ref string names[$]);
//        void'(create_object_by_name("foo"));
//        m_core.m_type_names["a"] = null;
//        foreach (m_core.m_type_names[i]) begin
//        end
//        if (m_core.m_type_names.exist("foo")) begin
//            $display("present");
//        end
    endfunction

    virtual function void register (uvm_object_wrapper obj);
        m_core.register(obj);
    endfunction

    virtual function
      void set_inst_override_by_type (uvm_object_wrapper original_type,
                                      uvm_object_wrapper override_type,
                                      string full_inst_path);
        m_core.set_inst_override_by_type(original_type, override_type, full_inst_path);
  endfunction

    virtual function
      void set_inst_override_by_name (string original_type_name,
                                      string override_type_name,
                                      string full_inst_path);
        m_core.set_inst_override_by_name(original_type_name, override_type_name, full_inst_path);
    endfunction

    virtual function
      void set_type_override_by_type (uvm_object_wrapper original_type,
                                      uvm_object_wrapper override_type,
                                      bit replace=1);
        m_core.set_type_override_by_type(original_type, override_type, replace);
    endfunction

    virtual function
      void set_type_override_by_name (string original_type_name,
                                      string override_type_name,
                                      bit replace=1);
        m_core.set_type_override_by_name(original_type_name, override_type_name, replace);
    endfunction

    virtual function
      uvm_object    create_object_by_type    (uvm_object_wrapper requested_type,
                                              string parent_inst_path="",
                                              string name="");
        return m_core.create_object_by_type(requested_type, parent_inst_path, name);
    endfunction

  // Function: create_component_by_type

    virtual function
      uvm_component create_component_by_type (uvm_object_wrapper requested_type,
                                              string parent_inst_path="",
                                              string name,
                                              uvm_component parent);
        return m_core.create_component_by_type(requested_type, parent_inst_path, name, parent);
    endfunction

  // Function: create_object_by_name

    virtual function
      uvm_object    create_object_by_name    (string requested_type_name,
                                              string parent_inst_path="",
                                              string name="");
        return m_core.create_object_by_name(requested_type_name, parent_inst_path, name);
    endfunction

    virtual function
      uvm_component create_component_by_name (string requested_type_name,
                                              string parent_inst_path="",
                                              string name,
                                              uvm_component parent);
        return m_core.create_component_by_name(requested_type_name, parent_inst_path, name, parent);
    endfunction

  // Group: Debug

  // Function: debug_create_by_type

    virtual function
      void debug_create_by_type (uvm_object_wrapper requested_type,
                                 string parent_inst_path="",
                                 string name="");
        m_core.debug_create_by_type(requested_type, parent_inst_path, name);
    endfunction

  // Function: debug_create_by_name
  //
  // These methods perform the same search algorithm as the ~create_*~ methods,
  // but they do not create new objects. Instead, they provide detailed
  // information about what type of object it would return, listing each
  // override that was applied to arrive at the result. Interpretation of the
  // arguments are exactly as with the ~create_*~ methods.

    virtual function
      void debug_create_by_name (string requested_type_name,
                                 string parent_inst_path="",
                                 string name="");
        m_core.debug_create_by_name(requested_type_name, parent_inst_path, name);
    endfunction


  // Function: find_override_by_type

    virtual function
      uvm_object_wrapper find_override_by_type (uvm_object_wrapper requested_type,
                                                string full_inst_path);
        return m_core.find_override_by_type(requested_type, full_inst_path);
    endfunction

    virtual function
      uvm_object_wrapper find_override_by_name (string requested_type_name,
                                                string full_inst_path);
        return m_core.find_override_by_name(requested_type_name, full_inst_path);
    endfunction

`ifdef UVM_MINOR_REV_2
    virtual
        function uvm_object_wrapper find_wrapper_by_name(string type_name);
        return m_core.find_wrapper_by_name(type_name);
    endfunction
`endif /* UVM_MINOR_REV_2 */

    virtual function void print (int all_types=1);
        m_core.print(all_types);
    endfunction

endclass

