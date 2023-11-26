function [index] = find_t(y,percentage)
    y_find = y(end)*percentage;
    
    % Calculate absolute differences
    abs_diff = abs(y - y_find);
    
    % Find the index of the minimum absolute difference
    [~, index] = min(abs_diff);
end

