
class via_uvm_object extends via_object_if;
    uvm_object      obj;

    function new(uvm_object obj);
        this.obj = obj;
    endfunction

    virtual function string get_name();
        return obj.get_name();
    endfunction

endclass
