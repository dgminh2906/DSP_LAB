// Set x-axis and y-axis at x = 0 and y = 0
function set_origin()
    a = gca();
    a.x_location = "origin";
    a.y_location = "origin";
endfunction
function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)
    // Set x1n, x2n to the same size
    diff = length(x1n) - length(x2n);
    if diff > 0 then
        x2n = [x2n, zeros(1, diff)];
    else
        x1n = [x1n, zeros(1, -diff)];    
    end
    // Add zeros to conveniently multiply two vector    
    if x1origin > x2origin then
        padded = x1origin - x2origin;
        x2origin = x1origin;
        x1n = [x1n, zeros(1, padded)];
        x2n = [zeros(1, padded), x2n];
    else     
        padded = x2origin - x1origin;
        x1origin = x2origin;        
        x1n = [zeros(1, padded), x1n];
        x2n = [x2n, zeros(1, padded)];
    end
    yn = x1n .* x2n;
    yorigin = x1origin;
    clf;
    set_origin;
    n = [1:length(yn)] - yorigin;
    plot2d3(n, x1n, -3);
    plot2d3(n, x2n, -4);
    plot2d3(n, yn, -2);
    legend(prettyprint(["x1(n)";"x2(n)";"y(n):"],"latex","",%t), 2);
    title("Multiplication operation");
endfunction

x1n = [0, 1, 3, -2];
x1origin = 1;
x2n = [1, 1, 2, 3];
x2origin = 2;
[yn, yorigin] = multi(x1n, x1origin, x2n, x2origin);
