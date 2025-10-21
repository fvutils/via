
typedef class via_uvm_component_factory;
typedef class via_uvm_object_factory;
typedef class via_uvm_object_type;
typedef class via_uvm_sequence_factory;
typedef class via_uvm_sequencer;

class via_uvm_type_rgy;
    static via_uvm_type_rgy     m_inst;
    via_uvm_object_type         m_obj_type_m[uvm_object_wrapper];

    virtual function via_uvm_object_type get_object_type(uvm_object obj);
        uvm_object_wrapper t = obj.get_object_type();
        via_uvm_object_type t_if;

        if (m_obj_type_m.exists(t)) begin
            t_if = m_obj_type_m[t];
        end else begin
            // Build a new one
            t_if = create_obj_type(obj);

            m_obj_type_m[t] = t_if;
        end

        return t_if;
    endfunction

    virtual function via_uvm_object create(uvm_object obj);
        via_uvm_object_type obj_t = get_object_type(obj);
        return obj_t.create(obj);
    endfunction

    function via_uvm_object_type create_obj_type(uvm_object obj);
        uvm_component comp;
        uvm_sequence_base seq;
        via_uvm_object_type t_if;

        if ($cast(comp, obj)) begin
            t_if = create_comp_type(comp);
        end else if ($cast(seq, obj)) begin
            t_if = new(obj.get_object_type(), via_uvm_sequence_factory::inst());
        end else begin
            // Just a plain UVM object
            t_if = new(obj.get_object_type(), via_uvm_object_factory::inst());
        end

        return t_if;
    endfunction

    function via_uvm_object_type create_comp_type(uvm_component comp);
        uvm_sequencer_base seqr;
        via_uvm_object_type t_if;

        if ($cast(seqr, comp)) begin
            t_if = new(seqr.get_object_type(), via_uvm_sequencer_factory::inst());
        end else begin
            // Just a plain component
            t_if = new(comp.get_object_type(), via_uvm_component_factory::inst());
        end

        return t_if;
    endfunction

    static function via_uvm_type_rgy inst();
        if (m_inst == null) begin
            m_inst = new();
        end
        return m_inst;
    endfunction

endclass

