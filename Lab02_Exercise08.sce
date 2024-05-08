clear;
// Set x-axis and y-axis at x = 0 and y = 0
function set_origin()
    a = gca();
    a.x_location = "origin";
    a.y_location = "origin";
endfunction

n = -2:1;
x = [1 -2 3 6];

// Draw original signal
function draw_original()
    subplot(121);
    plot2d3(n, x, 5);
    set_origin;
    xlabel("n", "color", "red", "box", "on");
    ylabel("x", "color", "red", "box", "on");
    title("x(n) = {1, -2, 3*, 6}", "color", "red");
endfunction

draw_original;
// Draw y1(n) = x(-n)
subplot(122);
plot2d3(-n, x, 3);
set_origin;
xlabel("n", "color", "green", "box", "on");
ylabel("y1", "color", "green", "box", "on");
title("y1(n) = x(-n)", "color", "green");

scf;
draw_original;
// Draw y2(n) = x(n + 3)
subplot(122);
plot2d3(n - 3, x, 3);
set_origin;
xlabel("n", "color", "green", "box", "on");
ylabel("y2", "color", "green", "box", "on");
title("y2(n) = x(n + 3)", "color", "green");

scf;
draw_original;
// Draw y3(n) = 2x(-n - 2)
subplot(122);
plot2d3(-n - 2, 2*x, 3);
set_origin;
xlabel("n", "color", "green", "box", "on");
ylabel("y3", "color", "green", "box", "on");
title("y3(n) = 2x(-n - 2)", "color", "green");
