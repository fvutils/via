/**
 * Utility functions for common simulator 
 */

function automatic void checkpoint_save(string name="");
`ifdef VCS
    if (name == "") begin
        name = "simv.chk";
    end
    $save(name);
`else
    `ifdef MODEL_TECH
        void'(mti_fli::mti_Cmd($sformatf("checkpoint %0s", name)));
    `else
        `VIA_FATAL(("checkpoint_save not implemented by the simulator"));
    `endif
`endif
endfunction
