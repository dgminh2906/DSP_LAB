function set_origin()
    a = gca()
    a.x_location = "origin";
    a.y_location = "origin";
endfunction

function [y_n, y_origin] = delay(x_n, x_origin, k)
    if (k < 0) then error('k must be greater than 0');
    end
    N = length(x_n);
    y_origin = x_origin - k;
    y_n = x_n(1:N);
    
    //Plot
    clf();
    x_padded = [x_n, zeros(1, k)];
    y_padded = [zeros(1, k), y_n];
    N_padded = length(x_padded);
    n = [1:N_padded] - x_origin;    
    set_origin();
    plot2d3(n, x_padded, 2); 
    plot2d3(n, y_padded, 3); 
    legend(prettyprint(["y(n) = x(n)";"y(n) = x(n - k)"],"latex","",%t),"n", "m", 2);
    title("Delay operation with k = " + string(k), "color", "red");
endfunction

x_n = [1, -2, 3, 6];
x_origin = 3;
k = 1;
[y_n, y_origin] = delay(x_n, x_origin, k);
