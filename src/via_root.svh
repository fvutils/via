
typedef class via_component_if;
typedef class via_root_if;
typedef class via_root_listener_if;

class via_root;
    static via_root inst;
    via_root_listener_if listeners[$];
    via_root_if roots[$];

    function void add_listener(via_root_listener_if listener);
        listeners.push_back(listener);
    endfunction

    function void add_root(via_root_if root);
        roots.push_back(root);
    endfunction

    function void post_build(via_component_if root);
        foreach (listeners[i]) begin
            listeners[i].post_build(root);
        end
    endfunction

    function void post_connect(via_component_if root);
        foreach (listeners[i]) begin
            listeners[i].post_connect(root);
        end
    endfunction

    virtual task run(via_component_if root);
        foreach (listeners[i]) begin
            automatic via_root_listener_if listener = listeners[i];
            fork
                listener.run(root);
            join_none
        end

        wait fork;
    endtask

    static function via_root get();
        if (inst == null) begin
            inst = new();
        end
        return inst;
    endfunction

endclass
