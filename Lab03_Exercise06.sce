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
        npad = x1origin - x2origin;
        x2origin = x1origin;
        x1n = [x1n, zeros(1, npad)];
        x2n = [zeros(1, npad), x2n];
    else     
        npad = x2origin - x1origin;
        x1origin = x2origin;        
        x1n = [zeros(1, npad), x1n];
        x2n = [x2n, zeros(1, npad)];
    end
    yn = x1n .* x2n;
    yorigin = x1origin;
endfunction

function [y_n, y_origin] = delay(x_n, x_origin, k)
    if (k < 0) then error('k must be greater than 0');
    end
    N = length(x_n);
    y_origin = x_origin - k;
    y_n = x_n(1:N);
endfunction

function [y_n, y_origin] = advance(x_n, x_origin, k)
    if (k < 0) then error('k must be greater than 0');
    end
    N = length(x_n);
    y_origin = x_origin + k;
    y_n = x_n(1:N);
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
endfunction


function [yn, yorigin] = convolution(xn, xorigin, hn, horigin) 
    nmin = -xorigin -horigin + 2;
    nmax = length(xn) - xorigin + length(hn) - horigin;
    for n0 = nmin : nmax
        if n0 < 0 then
            [h_shift, h_shift_org] = delay(hn, horigin, -n0);
        else 
            [h_shift, h_shift_org] = advance(hn, horigin, n0);
        end    
        [h_shift_fold, h_shift_fold_org] = fold(h_shift, h_shift_org);
        [mul_vec, mul_vec_org] = multi(xn, xorigin, h_shift_fold, h_shift_fold_org);
        yn($ + 1) = sum(mul_vec);
    end
    yn = yn';
    yorigin = -nmin + 1;
endfunction

hn = [2 3 1 -2]
horigin = 2
xn = [0 2 4 1]
xorigin = 1
[yn, yorigin] = convolution(xn, xorigin, hn, horigin)
