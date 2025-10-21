
typedef class via_uvm_factory;

class via_uvm_extension_component extends uvm_component implements via_root_if;
    `uvm_component_utils(via_uvm_extension_component)

    function new(string name, uvm_component parent);
        via_root root = via_root::get();
        super.new(name, parent);
        root.add_root(this);
    endfunction


    virtual function void info(int level, string msg);
        if (uvm_report_enabled(level, UVM_INFO, "")) begin
            uvm_report_info("", msg, level);
        end
        $display("UVM Info: %0s", msg);
    endfunction

    virtual function void error(string msg);
        $display("UVM Error: %0s", msg);
    endfunction

    virtual function void fatal(string msg);
        $display("UVM Fatal: %0s", msg);
    endfunction

    function void build_phase(uvm_phase phase);
        // uvm_coreservice_t s;
        // uvm_factory core;
        // via_uvm_factory new_factory;

        // s = uvm_coreservice_t::get();
        // core = s.get_factory();
        // new_factory = new(core);

        // // Insert our factory 
        // s.set_factory(new_factory);

        super.build_phase(phase);
        $display("Building via_uvm_extension_component");
        // Add your build phase code here
    endfunction

    function void connect_phase(uvm_phase phase);
        via_uvm_component root_w;
        uvm_component root_u = uvm_root::get();
        uvm_component children[$];
        via_root root = via_root::get();

        $display("connect_phase");

        root_u.get_children(children);

        foreach (children[i]) begin
            $display("children[%0d] = %s", i, children[i].get_full_name());
            if (children[i] != this) begin
                // TODO: need to go back to factory to establish type
                root_w = new(children[i], null);
                $display("--> post_build");
                root.post_build(root_w);
                $display("<-- post_build");
            end
        end

    endfunction

    virtual task run_phase(uvm_phase phase);
        via_uvm_component root_w;
        uvm_component root_u = uvm_root::get();
        uvm_component children[$];
        via_root root = via_root::get();

        $display("run_phase");

        root_u.get_children(children);

        foreach (children[i]) begin
            if (children[i] != this) begin
                // TODO:
                root_w = new(children[i], null);
                $display("--> post_connect");
                root.post_connect(root_w);
                $display("<-- post_connect");
            end
        end

        $display("Running via_uvm_extension_component");
        foreach (children[i]) begin
            if (children[i] != this) begin
                // TODO:
                root_w = new(children[i], null);
                fork
                    root.run(root_w);
                join_none
            end
        end

        wait fork;

    endtask


endclass

