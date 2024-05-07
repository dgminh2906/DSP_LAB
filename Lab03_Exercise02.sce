function set_origin()
    a = gca()
    a.x_location = "origin";
    a.y_location = "origin";
endfunction

function [y_n, y_origin] = advance(x_n, x_origin, k)
    if (k < 0) then error('k must be greater than 0');
    end
    N = length(x_n);
    y_origin = x_origin + k;
    y_n = x_n(1:N);
    
    //Plot
    clf();
    x_padded = [zeros(1, k), x_n];
    y_padded = [y_n, zeros(1, k)];
    N_padded = length(x_padded);
    n = [1:N_padded] - x_origin - k;
    set_origin();
    plot2d3(n, x_padded, 2);  
    plot2d3(n, y_padded, 3); 
    legend(prettyprint(["y(n) = x(n)";"y(n) = x(n + k)"],"latex","",%t), 2);
    title("Advance operation with k = " + string(k), "color", "red");
endfunction

[yn, yorigin] = advance ([1,  -2,  3,  6], 3, 1);

