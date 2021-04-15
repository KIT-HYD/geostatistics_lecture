disp('testing inverse_distance_fixed_radius.m ...')

% check the numbers against this sginificant deviation
sig = 0.01

xi = [410, -475, -350, 705, 575, 230, -500]
yi = [553, 923, -522, -87, -1027, -1802, -2002]
vi = [83, 72.5, 72.2, 79.6, 63.2, 83.1, 72.1]

% test 1
test1 = inverse_distance_fixed_radius(xi, yi, vi, 409, 555, 1000)
if abs(test1 - 82.97) > sig
  error('test 1 failed')
else
  disp('test 1 successfull.')
end

% test 2
test2 = inverse_distance_fixed_radius(xi, yi, vi, 250, 250, 750)
if abs(test2 - 81.72) > sig
  error('test 2 failed')
else
  disp('test 2 successfull.')
end

% test 3
test3 = inverse_distance_fixed_radius(xi, yi, vi, -500, -1500, 750)
if abs(test3 - 72.1) > sig
  error('test 3 failed')
else
  disp('test 3 successfull.')
end

disp('testing inverse_distance_fixed_neighbors.m ...')

% test 4
test4 = inverse_distance_fixed_neighbors(xi, yi, vi, -500, -1500, 4)
if abs(test4 - 73.36) > sig
  error('test 4 failed')
else
  disp('test 34 successfull.')
end

% test 5
test5 = inverse_distance_fixed_neighbors(xi, yi, vi, 250, 250, 3)
if abs(test5 - 80.01) > sig
  error('test 5 failed')
else
  disp('test 5 successfull.')
end

% test 6
test6 = inverse_distance_fixed_neighbors(xi, yi, vi, 409, 555, 5)
if abs(test6 - 82.92) > sig
  error('test 6 failed')
else
  disp('test 6 successfull.')
end


disp('finished. Your code works fine!')