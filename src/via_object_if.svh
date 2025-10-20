
typedef class via_object_type_if;
typedef class via_accept_if;
typedef class via_visitor;

class via_object_if extends via_accept_if;

    virtual function string get_name();
    endfunction

    virtual function via_object_type_if get_object_type();
    endfunction

    virtual function int pack_ints(ref int unsigned intstream[]);
    endfunction

    virtual function int unpack_ints(ref int unsigned intstream[]);
    endfunction

    virtual function void accept(via_visitor v);
        v.visit_object(this);
    endfunction

endclass

