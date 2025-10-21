
typedef interface class via_object_type_if;
typedef interface class via_accept_if;
typedef class via_field;
typedef class via_visitor;

interface class via_object_if extends via_accept_if;

    pure virtual function string get_name();

    pure virtual function via_object_type_if get_object_type();

    pure virtual function int pack_ints(ref int unsigned intstream[]);

    pure virtual function int unpack_ints(ref int unsigned intstream[]);


endclass

