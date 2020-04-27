x1 = 5.*randn(1, 500) + 1500;   % all positive
x2 = 2.*randn(1, 1000) + 1;     % negative and positive
x3 = 3.*randn(1, 500) - 130;    % all negative

sig = 0.001;

disp('---------------------------');
disp('Starting unit tests...');
% -------------------------------------------------------
% AVERAGE
disp('Starting unit tests for average.m');

% YOUR TESTS HERE

% -------------------------------------------------------
% STANDARD DEVIATION
disp('Starting unit tests for standard_deviation.m');

% YOUR TESTS HERE

% -------------------------------------------------------
% VARIANCE
disp('Starting unit tests for variance.m');

% YOUR TESTS HERE


% -------------------------------------------------------
% HISTOGRAM
disp('Starting unit tests for histogram_counts.m');

% YOUR TESTS HERE

disp('Everything seems to be fine.');
disp('----------------------------');
