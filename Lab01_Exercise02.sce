//Lab 1
//Exercise 2
//Ex2.1
t = linspace(0, 5.*(2/100), 1000);
// Plot the signal
subplot(3, 1, 1);
plot(t, 3 .* sin(100.*%pi.*t), "k");
xlabel('Time (s)');
ylabel('x_a(t)');
title('Analog signal x_a(t) in 5 periods');

//Ex2.2


//Ex2.3
n = linspace(0, 5.*6, 1000);
//Plot the signal
subplot(3, 1, 2);
plot(n, 3 .* sin(n.*%pi/3), "k");
xlabel('Time(s)');
ylabel('x(n)');
title('Discrete-time signal x(n) in 5 periods');

//Ex2.4
n = linspace(0, 5.*6, 1000);
//Plot the signal
subplot(3, 1, 3);
plot(n, 0.1 + 3 .* sin(n.*%pi/3), "k");
xlabel('Time(s)');
ylabel('x_q(n)');
title('Quantized signal x_q(n) in 5 periods');
