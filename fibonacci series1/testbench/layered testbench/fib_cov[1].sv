class fib_cov;
fib_trans trans = new();
covergroup cov_inst;
option.per_instance = 1;
ST:coverpoint trans.start {bins st = {0,1};}
I: coverpoint trans.i {bins i = { [0: 31]}; }
RY: coverpoint trans.ready {bins ry = {0,1};}
DT: coverpoint trans.done_tick {bins dt = {0,1};}
F: coverpoint trans.f {bins f = { [0: 1048575]}; }
endgroup
function new();
cov_inst = new;
endfunction
task main;
cov_inst. sample();
endtask
endclass
