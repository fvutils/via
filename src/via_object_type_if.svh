
typedef class via_field;
typedef interface class via_object_if;

interface class via_object_type_if;

    pure virtual function string get_name();

    pure virtual function via_kind_e get_kind();

    pure virtual function void get_fields(ref via_field fields[$]);

endclass
