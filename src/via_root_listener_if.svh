
typedef class via_component_if;

class via_root_listener;

    virtual function void post_build(via_component_if root);
    endfunction

    virtual function void post_connnect(via_component_if root);
    endfunction

    virtual task run(via_component_if root);
    endtask

endclass
