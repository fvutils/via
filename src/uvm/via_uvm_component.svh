
class via_uvm_component extends via_component_if;
    uvm_component   core;

    function new(uvm_component comp);
        this.core = comp;
    endfunction

    virtual function string get_name();
        return core.get_name();
    endfunction

    virtual function string get_full_name();
        return core.get_full_name();
    endfunction

endclass
