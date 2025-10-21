
typedef class via_uvm_component;
typedef class via_uvm_object;


class uvm_uvm_component_factory;


    via_uvm_object_factory m_inst;

    static function via_uvm_object_factory inst();
        if (m_inst == null) begin
            m_inst = new();
        end
        return m_inst;
    endfunction

    static function via_object_if mk(uvm_object obj);
    endfunction

endclass


