function overshoot = calculate_overshoot(y)
    % y: System response data (time-series)

    % Find peak of the response
    peak_value = max(y);

    % Calculate overshoot as a percentage
    steady_state_value = y(end);
    overshoot = ((peak_value - steady_state_value) / steady_state_value) * 100;
end
