
typedef interface class via_object_if;
typedef class via_visitor;

interface class via_component_if extends via_object_if;

    pure virtual function string get_full_name();

    pure virtual function via_object_if create_object_by_name(
        string typename,
        string name="");

endclass
