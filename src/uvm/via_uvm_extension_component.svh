
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
        via_uvm_component root_w;
        uvm_component root_u = uvm_root::get();
        uvm_component children[$];
        via_root root = via_root::get();

        root_u.get_children(children);

        foreach (children[i]) begin
            $display("children[%0d] = %s", i, children[i].get_full_name());
            if (children[i] != this) begin
                root_w = new(children[i]);
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

        root_u.get_children(children);

        foreach (children[i]) begin
            if (children[i] != this) begin
                root_w = new(children[i]);
                root.post_connect(root_w);
            end
        end

        $display("Running via_uvm_extension_component");
        foreach (children[i]) begin
            if (children[i] != this) begin
                root_w = new(children[i]);
                fork
                    root.run(root_w);
                join_none
            end
        end

        wait fork;

    endtask


endclass

