
class via_uvm_root extends via_root_if;
    uvm_component       m_root;

    virtual function void info(int level, string msg);
    endfunction

    virtual function void error(string msg);
    endfunction

    virtual function void fatal(string msg);
    endfunction

endclass

