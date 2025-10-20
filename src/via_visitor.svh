
typedef class via_component_if;
typedef class via_object_if;

class via_visitor;

    virtual function void visit_component(via_component_if obj);
    endfunction

    virtual function void visit_object(via_object_if obj);
    endfunction

endclass

