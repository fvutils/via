
class via_uvm_extension_component extends uvm_component;
    `uvm_component_utils(via_uvm_extension_component)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        $display("Building via_uvm_extension_component");
        // Add your build phase code here
    endfunction

    function void connect_phase(uvm_phase phase);
        via_uvm_component root;
        uvm_component uvm_root = uvm_root::get();
        uvm_component children[$];

        uvm_root.get_children(children);

        root = new(children[1]);
        via_root::get().add_root(root);

    endfunction

    virtual task run_phase(uvm_phase phase);

        super.run_phase(phase);
        $display("Running via_uvm_extension_component");
        via_root::get().run();
        // Add your run phase code here
    endtask


endclass

