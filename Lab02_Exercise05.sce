//Lab 2
//Exercise 5
//Define discrete-time signal x(n)
xn = [1, 3, -2];
// Compute the odd signal component x_o(n)
x_on = (xn - flipdim(xn, 2))/2;
//Compute the even signal component x_e(n)
x_en = (xn + flipdim(xn, 2))/2;
//Define range
n = -1:1;
//Plot x(n)
subplot(3,1,1);
plot2d3(n, xn);
title('Discrete-time signal x(n)');
xlabel('n');
ylabel('x(n)');
//Plot x_o(n)
subplot(3,1,2);
plot2d3(n, x_on);
title('Odd component signal x_o(n)');
xlabel('n');
ylabel('x_o(n)');
//Plot x_e(n)
subplot(3,1,3);
plot2d3(n, x_en);
title('Even component signal x_e(n)');
xlabel('n');
ylabel('x_e(n)');
