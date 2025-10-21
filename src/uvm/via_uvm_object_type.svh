
class via_uvm_object_type implements via_object_type_if;
    uvm_object_wrapper      m_type;
    via_uvm_object_factory  m_if_factory;
    via_field               m_fields[$];
    via_kind_e              m_kind;

    function new(uvm_object_wrapper t, via_uvm_object_factory if_f, via_kind_e kind);
        m_type = t;
        m_if_factory = if_f;
        m_kind = kind;
    endfunction

    virtual function string get_name();
        return m_type.get_type_name();
    endfunction

    virtual function via_kind_e get_kind();
        return m_kind;
    endfunction

    virtual function void get_fields(ref via_field fields[$]);
        foreach (m_fields[i]) begin
            fields.push_back(m_fields[i]);
        end
    endfunction

    function via_uvm_object create(uvm_object obj);
        return m_if_factory.create(obj, this);
    endfunction


endclass
