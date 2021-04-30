% Test models
%%% set the model here
sig = 0.01;

% SPHERICAL
% Test 1
% At lag 0, the nugget should be returned
if abs(spherical(0, 10, 10, 2) - 2) > sig 
  error('Test 1 failed');
else
  disp('Test 1 successful!');
end

% Test 2
% At lag r the sill shold be reached by 95%
if abs(spherical(15, 15, 10, 0) - 9.5) > 0.5 + sig
  error('Test 2 failed');
else
  disp('Test 2 successful!');
end

% Test 3
% Test value in between
if abs(spherical(10, 20, 10, 4) - 10.88) > sig
  error('Test 3 failed');
else
  disp('Test 3 successful!');
end

% EXPONENTIAL
% Test 4
% At lag 0, the nugget should be returned
if abs(exponential(0, 10, 10, 2) - 2) > sig 
  error('Test 4 failed');
else
  disp('Test 4 successful!');
end

% Test 5
% At lag r the sill shold be reached by 95%
if abs(exponential(15, 15, 10, 0) - 9.5) > 0.5 + sig
  error('Test 5 failed');
else
  disp('Test 5 successful!');
end

% Test 6
% Test value in between
if abs(exponential(10, 20, 10, 4) - 11.77) > sig
  error('Test 6 failed');
else
  disp('Test 6 successful!');
end

% GAUSSIAN
% Test 7
% At lag 0, the nugget should be returned
if abs(gaussian(0, 10, 10, 2) - 2) > sig 
  error('Test 7 failed');
else
  disp('Test 7 successful!');
end

% Test 8
% At lag r the sill shold be reached by 95%
if abs(gaussian(15, 15, 10, 0) - 9.5) > 0.5 + sig
  error('Test 8 failed');
else
  disp('Test 8 successful!');
end

% Test 9
% Test value in between
if abs(gaussian(10, 20, 10, 4) - 10.32) > sig
  error('Test 9 failed');
else
  disp('Test 9 successful!');
end