
class via_uvm_object extends via_object_if;
    uvm_object      obj;

    function new(uvm_object obj);
        this.obj = obj;
    endfunction

    virtual function string get_name();
        return obj.get_name();
    endfunction

    virtual function via_object_type_if get_object_type();
        uvm_object_wrapper t = obj.get_object_type();
        via_uvm_object_type t_if;

        if (m_obj_type_m.exists(t)) begin
            t_if = m_obj_type_m[t];
        end else begin
            // Build a new one
            t_if = new(t);
            m_obj_type_m[t] = t_if;
        end

        return t_if;
    endfunction

    virtual function int pack_ints(ref int unsigned intstream[]);
        return obj.pack_ints(intstream);
    endfunction

    virtual function int unpack_ints(ref int unsigned intstream[]);
        return obj.unpack_ints(intstream);
    endfunction

endclass
