
typedef class via_field;
typedef interface class via_object_if;

class via_object_type_if;
    via_field fields[$];

    virtual function string get_name();
        return "";
    endfunction

    virtual function void get_fields(ref via_field fields[$]);
    endfunction

endclass
