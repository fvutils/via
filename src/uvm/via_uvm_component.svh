
typedef class via_uvm_object;
typedef class via_uvm_object_factory;
typedef class via_uvm_object_type;
typedef class via_uvm_type_rgy;

class via_uvm_component extends via_uvm_object implements via_component_if;

    function new(uvm_object obj, via_uvm_object_type obj_t);
        super.new(obj, obj_t);
    endfunction

    virtual function string get_full_name();
        uvm_component comp;
        $cast(comp, m_obj);
        return comp.get_full_name();
    endfunction

    virtual function via_object_if create_object_by_name(
        string typename,
        string name="");
        uvm_component comp;
        uvm_object obj;
        via_uvm_object ret;

        $cast(comp, m_obj);
        obj = comp.create_object(typename, name);

        if (obj != null) begin
            ret = via_uvm_type_rgy::inst().create(obj);
        end

        return ret;
    endfunction

    virtual function void accept(via_visitor v);
        v.visit_component(this);
    endfunction

endclass

class via_uvm_component_factory extends via_uvm_object_factory;
    static via_uvm_component_factory m_inst;

    virtual function via_uvm_object create(
            uvm_object              obj,
            via_uvm_object_type     obj_t);
        via_uvm_component ret = new(obj, obj_t);
        return ret;
    endfunction

    static function via_uvm_object_factory inst();
        if (m_inst == null) begin
            m_inst = new();
        end
        return m_inst;
    endfunction


endclass