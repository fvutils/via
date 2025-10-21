
class via_uvm_object implements via_object_if;
    uvm_object              m_obj;
    via_uvm_object_type     m_type;

    function new(uvm_object obj, via_uvm_object_type obj_t);
        m_obj = obj;
        m_type = obj_t;
    endfunction

    virtual function string get_name();
        return m_obj.get_name();
    endfunction

    virtual function via_object_type_if get_object_type();
        return m_type;
    endfunction

    virtual function int pack_ints(ref int unsigned intstream[]);
        return m_obj.pack_ints(intstream);
    endfunction

    virtual function int unpack_ints(ref int unsigned intstream[]);
        return m_obj.unpack_ints(intstream);
    endfunction

    virtual function void accept(via_visitor v);
        v.visit_object(this);
    endfunction

endclass

class via_uvm_object_factory;
    static via_uvm_object_factory m_inst;

    virtual function via_uvm_object create(uvm_object obj, via_uvm_object_type obj_t);
        via_uvm_object ret = new(obj, obj_t);
        return ret;
    endfunction

    static function via_uvm_object_factory inst();
        if (m_inst == null) begin
            m_inst = new();
        end
        return m_inst;
    endfunction

endclass
