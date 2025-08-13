
class via_field;
    string name;

    function new(string name);
        this.name = name;
    endfunction

    function string get_name();
        return name;
    endfunction
endclass

class via_field_int extends via_field;
    int size;
    bit is_signed;

    function new(string name, int size, bit is_signed);
        super.new(name);
        this.size = size;
        this.is_signed = is_signed;
    endfunction
endclass