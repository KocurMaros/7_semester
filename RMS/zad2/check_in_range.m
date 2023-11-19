function in_range = check_in_range(input_signal, output_signal, hysteresis)
  % Define upper and lower bounds based on input and hysteresis
  upper_bound = input_signal + hysteresis;
  lower_bound = input_signal - hysteresis;
  
  % Initialize a boolean vector for output
  in_range = ones(size(output_signal));
  
  % Check each element of output_signal against the bounds
  for i = 1:length(output_signal)
    if output_signal(i) >= lower_bound(i) && output_signal(i) <= upper_bound(i)
      in_range(i) = 0;
    end
  end
  
  % Return the boolean vector indicating if each point is inside the range
end