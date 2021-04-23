x1 = 5.*randn(1, 500) + 1500;   % all positive
x2 = 2.*randn(1, 1000) + 1;     % negative and positive
x3 = 3.*randn(1, 500) - 130;    % all negative

sig = 0.001;

disp('---------------------------');
disp('Starting unit tests...');
% -------------------------------------------------------
% AVERAGE
disp('Starting unit tests for average.m');

% test 1
if abs(mean(x1) - average(x1)) < sig
    disp([num2str(mean(x1)), ' == ', num2str(average(x1))]);
else
  error(['Test 1 failed.', num2str(mean(x1)), ' != ', num2str(average(x1))]);
end

% test 2
if abs(mean(x2) - average(x2)) < sig
    disp([num2str(mean(x2)), ' == ', num2str(average(x2))]);
else
  error(['Test 2 failed.', num2str(mean(x2)), ' != ', num2str(average(x2))]);
end

% test 3
if abs(mean(x3) - average(x3)) < sig
    disp([num2str(mean(x3)), ' == ', num2str(average(x3))]);
else
  error(['Test 3 failed.', num2str(mean(x3)), ' != ', num2str(average(x3))]);
end

% -------------------------------------------------------
% STANDARD DEVIATION
disp('Starting unit tests for standard_deviation.m');

% test 4
if abs(std(x1) - standard_deviation(x1)) < sig
    disp([num2str(std(x1)), ' == ', num2str(standard_deviation(x1))]);
else
  error(['Test 4 failed.', num2str(std(x1)), ' != ', num2str(standard_deviation(x1))]);
end

% test 5
if abs(std(x2) - standard_deviation(x2)) < sig
    disp([num2str(std(x2)), ' == ', num2str(standard_deviation(x2))]);
else
  error(['Test 5 failed.', num2str(std(x2)), ' != ', num2str(standard_deviation(x2))]);
end

% test 6
if abs(std(x3) - standard_deviation(x3)) < sig
    disp([num2str(std(x3)), ' == ', num2str(standard_deviation(x3))]);
else
  error(['Test 6 failed.', num2str(std(x3)), ' != ', num2str(standard_deviation(x3))]);
end

% -------------------------------------------------------
% VARIANCE
disp('Starting unit tests for variance.m');

% test 7
if abs(var(x1) - variance(x1)) < sig
    disp([num2str(var(x1)), ' == ', num2str(variance(x1))]);
else
  error(['Test 7 failed.', num2str(var(x1)), ' != ', num2str(variance(x1))]);
end

% test 8
if abs(var(x2) - variance(x2)) < sig
    disp([num2str(var(x2)), ' == ', num2str(variance(x2))]);
else
  error(['Test 8 failed.', num2str(var(x2)), ' != ', num2str(variance(x2))]);
end

% test 9
if abs(var(x3) - variance(x3)) < sig
    disp([num2str(var(x3)), ' == ', num2str(variance(x3))]);
else
  error(['Test 9 failed.', num2str(var(x3)), ' != ', num2str(variance(x3))]);
end


% -------------------------------------------------------
% HISTOGRAM
disp('Starting unit tests for histogram_counts.m');

% Histogram test 1
[co1, ce1] = hist(x1, 25);
[cot1, cet1] = histogram_counts(x1, 25);
if (sum(co1 - cot1) < 25*sig) && (sum(ce1 - cet1) < 25*sig) 
  disp('Histogram 1 is fine.');
else
  error('Histogram test 1 failed.');
end

% Histogram test 2
[co2, ce2] = hist(x2, 100);
[cot2, cet2] = histogram_counts(x2, 100);
if (sum(co2 - cot2) < 100*sig) && (sum(ce2 - cet2) < 100*sig) 
  disp('Histogram 2 is fine.');
else
  error('Histogram test 2 failed.');
end

% Histogram test 3
[co3, ce3] = hist(x3, 42);
[cot3, cet3] = histogram_counts(x3, 42);
if (sum(co3 - cot3) < 42*sig) && (sum(ce3 - cet3) < 42*sig) 
  disp('Histogram 3 is fine.');
else
  error('Histogram test 3 failed.');
end

disp('Everything seems to be fine.');
disp('----------------------------');
