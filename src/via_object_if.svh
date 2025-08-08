
typedef class via_object_type_if;

class via_object_if;

    virtual function string get_name();
    endfunction

    virtual function via_object_type_if get_object_type();
    endfunction

    virtual function int pack_ints(ref int unsigned intstream[]);
    endfunction

    virtual function int unpack_ints(ref int unsigned intstream[]);
    endfunction

endclass

