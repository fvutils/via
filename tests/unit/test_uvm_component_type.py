import asyncio
import os
import pytest 
from pytest_dfm import dvflow, DvFlow

tests_dir = os.path.dirname(os.path.abspath(__file__))
proj_dir = os.path.abspath(os.path.join(tests_dir, "../.."))
data_dir = os.path.join(tests_dir, "data/uvm")

def test_smoke(tmpdir, dvflow : DvFlow):

    rundir = os.path.join(tmpdir, "rundir")

    dvflow.loadPkg(os.path.join(proj_dir, "flow.dv"))
    dvflow.builder.rundir = rundir

    via_uvm = dvflow.mkTask("via.UVMPkg")

    uvm = dvflow.mkTask("hdlsim.mti.SimLibUVM")

    test_src = dvflow.mkTask("std.FileSet",
                             srcdir=data_dir,
                             type="systemVerilogSource",
                             include="test_uvm_component_type.sv")

    sim = dvflow.mkTask("hdlsim.mti.SimImage",
                        needs=[uvm, via_uvm, test_src],
                        top=["test_uvm_component_type"])
    
    run = dvflow.mkTask("hdlsim.mti.SimRun",
                        needs=[sim])
    
    result = dvflow.runTask(run)

    assert result[0] == 0


    pass

