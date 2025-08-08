
typedef class via_uvm_object;

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

    virtual function via_object_if create_object_by_name(
        string typename,
        string name="");
        uvm_object obj = core.create_object(typename, name);
        via_uvm_object ret;

        if (obj != null) begin
            ret = new(obj);
        end

        return ret;
    endfunction

endclass
