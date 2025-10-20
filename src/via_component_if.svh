
typedef class via_object_if;
typedef class via_visitor;

class via_component_if extends via_object_if;

    virtual function string get_full_name();
    endfunction

    virtual function via_object_if create_object_by_name(
        string typename,
        string name="");
    endfunction

    virtual function void accept(via_visitor v);
        v.visit_component(this);
    endfunction

endclass
