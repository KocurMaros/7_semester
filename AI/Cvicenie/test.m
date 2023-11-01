
% Create a sine wave input signal.
input = sin(0:0.1:2*pi);

% Set the upper and lower thresholds.
threshold_up = 0.5;
threshold_down = -0.5;

% Calculate the output of the hysteresis system.
output = hysteresis(input, threshold_up, threshold_down);

% Plot the input and output signals.
figure;
plot(input, 'b');
hold on;
plot(output, 'r');
legend('Input', 'Output');
xlabel('Time');
ylabel('Signal');
title('Hysteresis Example');