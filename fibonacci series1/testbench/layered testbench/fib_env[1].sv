`include "fib_cov.sv"
class fib_env;
fib_gen gen;
fib_bfm bfm;
fib_cov cov;
mailbox gen2bfm;
virtual fib_intf intf;
event ended;
function new(virtual fib_intf intf);
this.intf = intf;
gen2bfm = new();
gen = new(gen2bfm, ended);
bfm = new(intf, gen2bfm);
cov = new();
endfunction
task pre_test;
bfm.reset();
endtask



task test;
fork
gen.main();
bfm.main();
cov.main();
join_any
endtask
task post_test;
wait(ended.triggered);
wait(gen.repeat_count == bfm.no_transactions);
endtask
task run;
pre_test();
test();
post_test();
$finish;
endtask
endclass
