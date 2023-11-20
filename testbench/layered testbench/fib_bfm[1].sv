class fib_bfm;
virtual fib_intf intf;
mailbox gen2bfm;
int no_transactions;
function new(virtual fib_intf intf,mailbox gen2bfm);
this.intf = intf;
this.gen2bfm = gen2bfm;
endfunction
task reset;

wait(intf.reset);
$display("Reset Initiated");
intf.bfm_cb.start <= 0;
intf.bfm_cb.i <= 0;
wait(!intf.reset);
$display("Reset finished");
endtask



task main;
forever begin
fib_trans trans;
gen2bfm.get(trans);
$display("Transaction No. = %0d", no_transactions);
intf.bfm_cb.start <= trans. start;
intf.bfm_cb.i <= trans.i;
repeat(2)@(posedge intf.clk);
trans.ready = intf.bfm_cb.ready;
trans.done_tick = intf.bfm_cb.done_tick;
trans.f = intf.bfm_cb.f;
trans.display();
no_transactions++;
end
endtask
endclass
