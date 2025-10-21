
typedef class via_uvm_component;
typedef class via_uvm_object_factory;

class via_uvm_sequencer extends via_uvm_component implements via_sequencer_if;
    function new(uvm_object seqr, via_uvm_object_type obj_t);
        super.new(seqr, obj_t);
    endfunction

endclass

class via_uvm_sequencer_factory extends via_uvm_object_factory;
    static via_uvm_sequencer_factory m_inst;

    virtual function via_uvm_object create(uvm_object obj, via_uvm_object_type obj_t);
        via_uvm_sequencer ret = new(obj, obj_t);
        return ret;
    endfunction

    static function via_uvm_object_factory inst();
        if (m_inst == null) begin
            m_inst = new();
        end
        return m_inst;
    endfunction

endclass

