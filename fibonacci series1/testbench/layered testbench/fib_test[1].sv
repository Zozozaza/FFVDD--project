program fib_test(fib_intf intf);
fib_env env;
initial begin
env = new(intf);
env.gen.repeat_count = 200;
env.run();
end
endprogram