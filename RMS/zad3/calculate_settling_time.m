function settling_time = calculate_settling_time(t, y, percent_range)
    % t: Time data
    % y: System response data (time-series)
    % percent_range: Percentage range for settling time calculation (e.g., 2%)

    % Compute the range for settling
    range = percent_range / 100 * (max(y) - min(y));

    % Find indices within the range of the steady-state value
    steady_state_value = y(end);
    indices_within_range = find(abs(y - steady_state_value) <= range);

    % Calculate settling time as the duration from the start to the last index within the range
    settling_time = t(indices_within_range(end)) - t(1);
end

