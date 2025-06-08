
class via_uvm_component extends via_component;
    uvm_component   core;

    function new(uvm_component comp);
        this.core = comp;
    endfunction

endclass
