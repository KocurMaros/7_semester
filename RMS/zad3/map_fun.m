function y = map_fun(ymin, ymax, xmin, xmax, x)
    % Check if x is within the range [xmin, xmax]
    if x < xmin || x > xmax
        error('x is outside the range [xmin, xmax]');
    end
    
    % Perform linear interpolation
    y = ymin + (ymax - ymin) * ((x - xmin) / (xmax - xmin));
end
