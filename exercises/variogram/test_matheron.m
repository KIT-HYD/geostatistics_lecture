% Test Matheron

% significance 
sig = 0.01;

% create a few different datasets
x1 = [1 1 1 1 1 1 1 1 1 1 1 1 1 1];
x2 = [4 8 7 3 0 12 9 8 7 6 5 4 33 3 8 3 8 6 7 5 6 8];
x3 = [-4 5 -7 18 -5  -1 0 0 2 3 -18 -2 -5 8 7 6 5];

% test x1:
if abs(matheron(x1) - 0.5) > sig
  error('Test 1 failed!');
else
  disp('Test 1 successful.');
end


% test x2:
if abs(matheron(x2) - 45.41) > sig
  error('Test 2 failed!');
else
  disp('Test 2 successful.');
end


% test x3:
if abs(matheron(x3) - 28.82) > sig
  error('Test 3 failed!');
else
  disp('Test 3 successful.');
end
 