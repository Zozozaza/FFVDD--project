
module tb_fib_top;
bit clk;
bit reset;
fib_intf intf(clk,reset);
fib_test test(intf);
fib dut(.clk(intf.clk),
.reset(intf.reset),
. start (intf.start),
.i(intf.i),
.ready(intf.ready),
.done_tick(intf.done_tick),
.f(intf.f)
);
always #5 clk = ~clk;
initial begin
reset = 1;
#5;
reset = 0;
end
endmodule
