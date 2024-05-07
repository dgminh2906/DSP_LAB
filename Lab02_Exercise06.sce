clear
function set_origin()
    // Set x-axis and y-axis at x = 0 and y = 0
    a = gca();
    a.x_location = "origin";
    a.y_location = "origin";
endfunction
n = -1:3
x1 = [0 0 1 3 -2]
x2 = [0 1 2 3 0]
y = x1 + x2
subplot(131)
plot2d3(n, x1, 5)
set_origin
xlabel("color", "red")
ylabel("color", "red")
title("x1 = {0*, 1, 3, -2}", "color", "red")

subplot(132)
plot2d3(n, x2, 3)
set_origin
xlabel("color", "green")
ylabel("color", "green")
title("x2 = {0, 1*,2, 3}", "color", "green")

subplot(133)
plot2d3(n, y, 2)
set_origin
xlabel("color", "blue")
ylabel("color", "blue")
title("y = x1 + x2", "color", "blue")
