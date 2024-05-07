clear; // Clear old memories
function set_origin()
    // Set x-axis and y-axis at y = 0 and x = 0
    a = gca();
    a.x_location = "origin";
    a.y_location = "origin";
endfunction
n = -1:1; // Index with non-zero value of x
x = [1 3 -2];
max_n = max(n);
min_n = min(n);
max_amplitude = max([max_n, -min_n]);
n = -max_amplitude:max_amplitude;
ext_x_len = 1; // Values of signal x from -max_amplitude to max_amplitude
runner_n = -max_amplitude;
while runner_n < min_n
    runner_n = runner_n + 1;
    ext_x(ext_x_len) = 0;
    ext_x_len = ext_x_len + 1
end
x_index = 1;
while runner_n <= max_n
    runner_n = runner_n + 1;
    ext_x(ext_x_len) = x(x_index);
    ext_x_len = ext_x_len + 1;
    x_index = x_index + 1;
end
while runner_n <= max_amplitude
    runner_n = runner_n + 1;
    ext_x(ext_x_len) = 0;
    ext_x_len = ext_x_len + 1;
end
// Calculate x_fold(n) = x(-n)
x_fold = flipdim(ext_x, 1)

// Calculate x_e, x_o
x_even = 1/2 * (ext_x + x_fold);
x_odd = 1/2 * (ext_x - x_fold);
// Draw x(n)
subplot(131);
plot2d3(n, ext_x, 5);
set_origin;
xlabel("color", "red");
ylabel("color", "red");
title("x(n) = {1, 3*, -2}", "color", "red");
// Draw x_even
subplot(132);
plot2d3(n, x_even, 3);
set_origin;
xlabel("color", "green");
ylabel("color", "green");
title("x_even(n) = 1/2[x(n) + x(-n)]", "color", "green");
// Draw x_odd
subplot(133);
plot2d3(n, x_odd, 2);
set_origin;
xlabel("color", "blue");
ylabel("color", "blue");
title("x_odd(n) = 1/2[x(n) - x(-n)]", "color", "blue");
