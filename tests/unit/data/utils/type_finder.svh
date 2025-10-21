
class type_finder extends via_visitor;
    via_object_if          objects[$];
    via_component_if       components[$];

    virtual function void visit_object(via_object_if obj);
        objects.push_back(obj);
    endfunction

    virtual function void visit_component(via_component_if obj);
        components.push_back(obj);
    endfunction

endclass
