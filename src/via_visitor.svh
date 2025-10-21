
typedef interface class via_component_if;
typedef interface class via_object_if;
typedef interface class via_sequence_if;
typedef interface class via_sequencer_if;

class via_visitor;

    virtual function void visit_component(via_component_if obj);
    endfunction

    virtual function void visit_object(via_object_if obj);
    endfunction

    virtual function void visit_sequence(via_sequence_if obj);
    endfunction

    virtual function void visit_sequencer(via_sequencer_if obj);
    endfunction

endclass

