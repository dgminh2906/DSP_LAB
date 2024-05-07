function set_origin()
    a = gca()
    a.x_location = "origin";
    a.y_location = "origin";
endfunction
function [y_n, y_origin] = fold(x_n, x_origin)
    N = length(x_n);
    y_origin = N - x_origin + 1;
    y_n = flipdim(x_n, 2);
    num_left = x_origin - 1;
    num_right = N - x_origin;
    k = num_left - num_right;
    if (k <= 0) then
        x_padded = [zeros(1, -k), x_n];
        y_padded = [y_n, zeros(1, -k)];
        N = length(x_padded);
        n = [1:N] - x_origin - (-k);
    else 
        x_padded = [x_n, zeros(1, k)];
        y_padded = [zeros(1, k), y_n];
        N = length(x_padded);
        n = [1:N] - x_origin;
    end
    // Plot
    clf();
    set_origin();
    plot2d3(n, x_padded, 2);  
    plot2d3(n, y_padded, 3); 
    legend(prettyprint(["y(n) = x(n)";"y(n) = x(-n)"],"latex","",%t), 2);
    title("Folding operation y(n) = x(-n)", "color", "red");
endfunction

[yn, yorigin] = fold ([1,  -2,  3,  6], 3);
