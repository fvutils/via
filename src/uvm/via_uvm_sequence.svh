
typedef class via_uvm_object;
typedef class via_uvm_object_factory;
typedef class via_uvm_sequencer;

class via_uvm_sequence extends via_uvm_object implements via_sequence_if;

    function new(uvm_object seq, via_uvm_object_type obj_t);
        super.new(seq, obj_t);
    endfunction

    virtual task start(via_sequencer_if sequencer);
        uvm_sequence_base seq;
        uvm_sequencer_base seqr;
        via_uvm_sequencer via_seqr;
        $cast(via_seqr, sequencer);
        $cast(seq, m_obj);
        $cast(seqr, via_seqr.m_obj);
        seq.start(seqr);
    endtask

endclass

class via_uvm_sequence_factory extends via_uvm_object_factory;
    static via_uvm_sequence_factory m_inst;

    virtual function via_uvm_object create(uvm_object obj, via_uvm_object_type obj_t);
        via_uvm_sequence ret = new(obj, obj_t);
        return ret;
    endfunction

    static function via_uvm_object_factory inst();
        if (m_inst == null) begin
            m_inst = new();
        end
        return m_inst;
    endfunction

endclass

