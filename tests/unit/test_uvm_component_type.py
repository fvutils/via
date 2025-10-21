import asyncio
import os
import pytest 
from pytest_dfm import dvflow, DvFlow

tests_dir = os.path.dirname(os.path.abspath(__file__))
proj_dir = os.path.abspath(os.path.join(tests_dir, "../.."))
data_dir = os.path.join(tests_dir, "data/uvm")
utils_dir = os.path.join(tests_dir, "data/utils")

from dv_flow.libhdlsim.pytest import hdlsim_dvflow, HdlSimDvFlow, hdlsim_available_sims

def available_sims(incl=None, excl=None):
    if excl is None:
        excl = ["xsm", "vlt"]
    return hdlsim_available_sims(incl, excl)

@pytest.mark.parametrize("hdlsim_dvflow", available_sims(), indirect=True)
def test_smoke(tmpdir, hdlsim_dvflow : HdlSimDvFlow):
    sim = hdlsim_dvflow.sim

    rundir = os.path.join(tmpdir, "rundir")

    hdlsim_dvflow.loadPkg(os.path.join(proj_dir, "flow.dv"))
    hdlsim_dvflow.builder.rundir = rundir

    via_uvm = hdlsim_dvflow.mkTask("via.UVMPkg")

    uvm = hdlsim_dvflow.mkTask(f"hdlsim.{sim}.SimLibUVM")

    test_src = hdlsim_dvflow.mkTask("std.FileSet", name="test_src",
                             srcdir=data_dir,
                             type="systemVerilogSource",
                             include="test_uvm_component_type.sv",
                             incdirs=["."])

    test_utils = hdlsim_dvflow.mkTask("std.FileSet", name="test_utils",
                             srcdir=utils_dir,
                             type="systemVerilogSource",
                             include="test_utils.sv",
                             incdirs=["."])

    sim_img = hdlsim_dvflow.mkTask(f"hdlsim.{sim}.SimImage",
                        needs=[uvm, via_uvm, test_utils, test_src],
                        top=["test_uvm_component_type"])
    
    run = hdlsim_dvflow.mkTask(f"hdlsim.{sim}.SimRun",
                        needs=[sim_img])
    
    result = hdlsim_dvflow.runTask(run)

    assert result[0] == 0


    pass

