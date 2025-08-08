
typedef class via_component_if;
typedef interface class via_root_if;
typedef class via_root_listener_if;

class via_root implements via_root_if;
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
        $display("via_root::post_connect %0d", listeners.size());
        foreach (listeners[i]) begin
            $display("--> listeners[%0d].post_connect", i);
            listeners[i].post_connect(root);
            $display("<-- listeners[%0d].post_connect", i);
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

    virtual function void info(int level, string msg);
        if (roots.size() > 0) begin
            roots[0].info(level, msg);
        end else begin
            $display("VIA Info: %0s", msg);
        end
    endfunction

    virtual function void error(string msg);
        if (roots.size() > 0) begin
            roots[0].error(msg);
        end else begin
            $display("VIA Error: %0s", msg);
        end
    endfunction

    virtual function void fatal(string msg);
        if (roots.size() > 0) begin
            roots[0].fatal(msg);
        end else begin
            $display("VIA Fatal: %0s", msg);
            $finish;
        end
    endfunction

    static function via_root get();
        if (inst == null) begin
            inst = new();
        end
        return inst;
    endfunction

endclass
