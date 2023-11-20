
interface fib_intf(input logic clk,reset);
logic start;
logic [4:0] i;

logic  ready;
logic done_tick;
logic [19:0] f;

clocking bfm_cb @(posedge clk);
default input #1 output #1;
output start;
output i;
input ready;
input done_tick;
input f;
endclocking

clocking monitor_cb @(posedge clk);
default input #1 output #1;
input start;
input i;
input ready;
input done_tick;
input f;
endclocking
modport BFM (clocking bfm_cb, input clk,reset);
modport MONITOR (clocking monitor_cb, input clk, reset);
endinterface
