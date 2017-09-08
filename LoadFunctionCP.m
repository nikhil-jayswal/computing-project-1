%% Modified from code provided by K. D. Hjelmstad

function [p] = LoadFunctionCP(x, L, type, varargin)
% varargin = fraction of length (for trapezoidal load)
% varargin = start and end of patch (for patch load)
    if (type < 1) || (type > 6)
        type = 1;
    end
    switch type
        case 1 % Constant Load
            p = 1;
        case 2 % Linear ramp up
            p = x/L;
        case 3 % Linear ramp down
            p = 1 - x/L;
        case 4 % Trapezoidal Load
            g = cell2mat(varargin);
            l = (1 - g)*L;
            if (x < l/2)
                p = 2*x/l;
            elseif (x > (1+g)*L/2)
                p = 2 * (L - x)/l;
            else
                p = 1;
            end
        case 5 % Half Sinusoid
            p = sin(pi*x/L);
        case 6 % Patch Load
            params = cell2mat(varargin);
            if (x < params(1)*L) || (x > params(2)*L)
                p = 0;
            else
                p = 1;
            end
    end
end
