function [b] = GTR(delta, beta, f1, f2)
    b = delta * (beta * f1 + (1 - beta) * f2);  
end

