function rise_time = calculate_rise_time(t, y, threshold)
    % t: Time data
    % y: System response data (time-series)
    % threshold: Percentage (e.g., 10% and 90%) for rise time calculation

    % Find indices when response crosses the threshold
    threshold_value = threshold / 100 * (max(y) - min(y)) + min(y);
    crossing_indices = find(y > threshold_value);

    % Find rise time between 10% and 90% of the response
    rise_time = t(crossing_indices(end)) - t(crossing_indices(1));
end
