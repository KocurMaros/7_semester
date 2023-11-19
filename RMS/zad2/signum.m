function x = signum(u)
%SIGNUM Summary of this function goes here
%   Detailed explanation goes here
    if(u > 0)
        x = 1;
    elseif(u < 0)
        x = -1;
    else
        x = 0;
    end
end

