function isOscillating = detectOscillations(systemResponse)
    % Check for oscillations in the system response

    % Define a threshold for oscillation detection
    threshold = 1; % You may need to adjust this based on your system

    % Calculate the mean value of the response
    responseMean = mean(systemResponse);

    % Calculate the oscillation amplitude
    oscillationAmplitude = max(systemResponse) - min(systemResponse);

    % Check if the oscillation amplitude exceeds the threshold
    if oscillationAmplitude > threshold * responseMean
        isOscillating = true;
    else
        isOscillating = false;
    end
end
