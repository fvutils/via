
`define TEST_UTILS_ASSERT(expr) \
    if (! (expr) ) begin \
       $display("ASSERT FAILED: %0s", \
       `"expr`" ); \
       $finish; \
    end else begin \
       $display("ASSERT PASSED: %0s", \
       `"expr`" ); \
    end
