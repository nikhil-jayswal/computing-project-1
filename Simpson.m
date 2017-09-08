function [b] = Simpson(L, type, npts, varargin)
    %% simpson weights
    wt = ones(npts, 1);
    for i = 2:npts-1
        if rem(i, 2) == 0
            wt(i) = 4;
        else
            wt(i) = 2;
        end
    end

    %% integrate
    h = L/(npts - 1);
    wt = wt * h/3;
    sum0 = 0; % I0
    sum1 = 0; % I1
    params = cell2mat(varargin);
    for i = 1:npts
        x = L * (i - 1)/(npts - 1);
        p = LoadFunctionCP(x, L, type, params);
        sum0 = sum0 + wt(i)*p;
        sum1 = sum1 + wt(i)*p*(L-x);
    end
b = [sum0; sum1];    
end



    