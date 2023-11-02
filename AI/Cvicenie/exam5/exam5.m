exam5_1;
% exam5_2;
% exam5_3;

% sim_time = 20;
% sim_step = 1/200;
% 
% lpop = 50;
% numgen=100;
% u = 33.6;
% lstring=3;
% pid_space = u*2;
% Define the scripts you want to run

script1 = @() test1();
script2 = @() test2();
script3 = @() test3();

% Start parallel pool (if not already started)
if isempty(gcp('nocreate'))
    parpool('local', 3); % Start a parallel pool with 3 workers
end

% Create a cell array of function handles
scripts = {script1, script2, script3};

% Initialize an array to store results
results = zeros(1, numel(scripts));

% Run the scripts in parallel using parfor
parfor i = 1:numel(scripts)
    results(i) = feval(scripts{i});
end

% Check if results are available
if all(results == 0)
    disp('All scripts ran successfully.');
else
    disp('One or more scripts encountered an error.');
end

% Delete the parallel pool (optional)
delete(gcp('nocreate'));