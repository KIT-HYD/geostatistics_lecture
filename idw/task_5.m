% apply the inverse distance interpolation

% -------------------------------------------------
% params - you can change this stuff
% and play around a little bit
gridsize = 100;
radius = 10000;
max_neighbors = 5;
% -------------------------------------------------

% input data
xi = [410, -475, -350, 705, 575, 230, -500]
yi = [553, 923, -522, -87, -1027, -1802, -2002]
vi = [83, 72.5, 72.2, 79.6, 63.2, 83.1, 72.1]

fprintf('Fixed Radius of %d m on %d grid...', radius, gridsize);
grid1 = inverse_distance(xi, yi, vi, gridsize, 1, radius);
fprintf('Fixed of maximum %d neighbors on %d grid...', max_neighbors, gridsize);
grid2 = inverse_distance(xi, yi, vi, gridsize, 2, max_neighbors);

% Plotting routine
figure;
subplot(1,2,1);
h = pcolor(grid1);
set(h, 'EdgeColor', 'none');
colorbar;
title(['Fixed radius: ', num2str(radius), ' meter']);

subplot(1,2,2);
h2 = pcolor(grid2);
set(h2, 'EdgeColor', 'none');
colorbar;
title(['Fixed neighbors: ', num2str(max_neighbors)]); 