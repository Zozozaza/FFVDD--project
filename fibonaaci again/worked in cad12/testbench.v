module fib_tb;

  // Inputs
  reg clk;
  reg reset;
  reg start;
  reg [4:0] i;

  // Outputs
  wire ready;
  wire done_tick;
  wire [19:0] f;

  // Instantiate the Fibonacci module
  fib fib_inst (
    .clk(clk),
    .reset(reset),
    .start(start),
    .i(i),
    .ready(ready),
    .done_tick(done_tick),
    .f(f)
  );

  
  // Clock generation
  always begin
    #5 clk = ~clk; // Toggle the clock every 5 time units
  end

  // Initial values
  initial begin
    clk = 0;
    reset = 0;
    start = 0;
    i = 0;

    // Reset sequence
    reset = 1;
    #10 reset = 0;
    #10 reset = 1;
    #10 reset = 0;


    // Test cases
    // Test case 1: Fibonacci(0)
    start = 1;
    i = 0;
    #20;
    start = 0;

    // Test case 2: Fibonacci(1)
    start = 1;
    i = 1;
    #20;
    start = 0;


    // Test case 3: Fibonacci(2)
    start = 1;
    i = 2;
    #20;
    start = 0;


    // Test case 4: Fibonacci(3)
    start = 1;
    i = 3;
    #20;
    start = 0;


    // Test case 5: Fibonacci(4)
    start = 1;
    i = 4;
    #20;
    start = 0;


    // Test case 6: Fibonacci(5)
    start = 1;
    i = 5;
    #20;
    start = 0;


    // Test case 7: Fibonacci(3)
    start = 1;
    i = 3;
    #20;
    start = 0;

    // Test case 8: Fibonacci(6)
    start = 1;
    i = 6;
    #20;
    start = 0;


    // Test case 9: Fibonacci(7)
    start = 1;
    i = 7;
    #20;
    start = 0;


    
    // Test case 10: Fibonacci(8)
    start = 1;
    i = 8;
    #20;
    start = 0;

// Test case 10: Fibonacci(8)
    start = 1;
    i = 9;
    #20;
    start = 0;

// Test case 10: Fibonacci(8)
    start = 1;
    i = 10;
    #20;
    start = 0;

// Test case 10: Fibonacci(8)
    start = 1;
    i = 11;
    #20;
    start = 0;

// Test case 10: Fibonacci(8)
    start = 1;
    i = 12;
    #20;
    start = 0;
// Test case 10: Fibonacci(8)
    start = 1;
    i = 13;
    #20;
    start = 0;
// Test case 10: Fibonacci(8)
    start = 1;
    i = 14;
    #20;
    start = 0;
// Test case 10: Fibonacci(8)
    start = 1;
    i = 15;
    #20;
    start = 0;
// Test case 10: Fibonacci(8)
    start = 1;
    i = 16;
    #20;
    start = 0;
// Test case 10: Fibonacci(8)
    start = 1;
    i = 17;
    #20;
    start = 0;
// Test case 10: Fibonacci(8)
    start = 1;
    i = 18;
    #20;
    start = 0;
// Test case 10: Fibonacci(8)
    start = 1;
    i = 20;
    #20;
    start = 0;
// Test case 10: Fibonacci(8)
    start = 1;
    i = 21;
    #20;
    start = 0;
// Test case 10: Fibonacci(8)
    start = 1;
    i = 22;
    #20;
    start = 0;
// Test case 10: Fibonacci(8)
    start = 1;
    i = 23;
    #20;
    start = 0;
// Test case 10: Fibonacci(8)
    start = 1;
    i = 24;
    #20;
    start = 0;
// Test case 10: Fibonacci(8)
    start = 1;
    i = 25;
    #20;
    start = 0;
// Test case 10: Fibonacci(8)
    start = 1;
    i = 26;
    #20;
    start = 0;
// Test case 10: Fibonacci(8)
    start = 1;
    i = 27;
    #20;
    start = 0;
// Test case 10: Fibonacci(8)
    start = 1;
    i = 28;
    #20;
    start = 0;
// Test case 10: Fibonacci(8)
    start = 1;
    i = 29;
    #20;
    start = 0;
// Test case 10: Fibonacci(8)
    start = 1;
    i = 30;
    #20;
    start = 0;
// Test case 10: Fibonacci(8)
    start = 1;
    i = 31;
    #20;
    start = 0;
// Test case 10: Fibonacci(8)
    start = 1;
    i = 32;
    #20;
    start = 0;

    $finish;
  end

endmodule
