
class via_uvm_analysis_port_listener_proxy extends uvm_port_base;
    via_analysis_port_listener m_listener;

    virtual function void write(uvm_object t);
        via_uvm_object wrap = new(t);
        m_listener.write(wrap);
    endfunction

endclass