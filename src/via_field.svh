
typedef class via_object_type_if;

typedef enum {
    FIELD_KIND_INT,
    FIELD_KIND_STR,
    FIELD_KIND_OBJ
} via_field_kind_e;

class via_field;
    string              name;
    via_field_kind_e    kind;
    int                 size;
    bit                 is_signed;
    via_object_type_if  obj_type;

    function new(
        string              name,
        via_field_kind_e    kind,
        int                 size=-1,
        bit                 is_signed=0,
        via_object_type_if  obj_type=null);
        this.name       = name;
        this.kind       = kind;
        this.size       = size;
        this.is_signed  = is_signed;
        this.obj_type   = obj_type;
    endfunction

    function string get_name();
        return name;
    endfunction

    function via_field_kind_e get_kind();
        return kind;
    endfunction

    function int get_size();
        return size;
    endfunction

    function int get_signed();
        return is_signed;
    endfunction

    function via_object_type_if get_obj_type();
        return obj_type;
    endfunction
endclass
