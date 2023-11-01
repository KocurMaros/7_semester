function [result] = decide_if_value_in_interval_is_less_than_input_value(data_array, input_value, low,up)
%DECIDE_IF_VALUE_IN_INTERVAL_IS_LESS_THAN_INPUT_VALUE Decides if a value in a 2D array of time and data is less than a given input value, within a given interval.
%
%   Inputs:
%
%     INPUT_ARRAY: A 2D array of time and data.
%     INTERVAL: A 2-element array containing the start and end of the interval.
%     INPUT_VALUE: The input value to compare to.
%
%   Outputs:
%
%     RESULT: A logical array of the same size as INPUT_ARRAY, indicating whether or not the value in each element is less than INPUT_VALUE, within the interval.

% Get the time and data arrays.

% Find the indices of the elements in the interval.

% Get the data values at the interval indices.
interval_data = data_array(low:up);
interval_data_in = input_value(low:up);
% Compare the interval data to the input value.
result = interval_data < interval_data_in;

end