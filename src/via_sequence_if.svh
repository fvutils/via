
typedef interface class via_object_if;
typedef interface class via_sequencer_if;

interface class via_sequence_if extends via_object_if;

    pure virtual task start(via_sequencer_if sequencer);

endclass