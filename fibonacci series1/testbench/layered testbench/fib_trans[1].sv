class fib_trans;
rand bit start;
rand bit [4:0] i;
bit ready;
bit done_tick;
bit [19:0] f;
function void display();
$display(" ");
$display("\t start = %0b, \t i = %0b, \t ready = %0b, \t done_tick = %0b, \t f = %0b", start,i,ready,done_tick,f);
$display(" ");

endfunction
endclass
