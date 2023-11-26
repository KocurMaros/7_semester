function [t_infl,tngt,Tus,Tn] = infp(y,t)
    d1y = gradient(y,t);                 % Numerical Derivative
    d2y = gradient(d1y,t);               % Numerical Second Derivative
    t_infl = interp1(d1y, t, max(d1y));  % Find ‘t’ At Maximum Of First Derivative
    y_infl = interp1(t, y, t_infl);      % Find ‘y’ At Maximum Of First Derivative
    slope  = interp1(t, d1y, t_infl);    % Slope Defined Here As Maximum Of First Derivative
    intcpt = y_infl - slope*t_infl;      % Calculate Intercept
    tngt = slope*t + intcpt;             % Calculate Tangent Line
    
    Tus = -intcpt/slope;
    Tn = (y(end) - intcpt)/slope - Tus;
end