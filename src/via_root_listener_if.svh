
typedef class via_component_if;

class via_root_listener_if;

    virtual function void post_build(via_component_if root);
    endfunction

    virtual function void post_connect(via_component_if root);
    endfunction

    virtual task run(via_component_if root);
    endtask

endclass
