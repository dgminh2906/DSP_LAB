x1 = [0, 0, 1, 3, -2];
x2 = [0, 1, 2, 3, 0];
y = x1 + x2;
n = -1:3;
// Plot x1
subplot(3, 1, 1);
plot2d3(n, x1);
title("Discrete-time signal x1n");
xlabel('n');
ylabel('x1n');
// Plot x2
subplot(3, 1, 2);
plot2d3(n, x2);
title("Discrete-time signal x2n");
xlabel('n');
ylabel('x2n');
// Plot y
subplot(3, 1, 3);
plot2d3(n, y);
title("Discrete-time signal y");
xlabel('n');
ylabel('y');
