%% Task 1
pkg load statistics % you may need to uncomment this is Matlab
warning('off', 'all');

% read the data
data = dlmread('artificial.csv', ',');
xi = data(:, 1);
yi = data(:, 2);
zi = data(:, 3);

%% -----------------------------
%% Set the parameters here
% from the fitting exercise, we use the following variogram parameters:
range = 55;
sill = 1.6;
nugget = 0.0;

% set the model
model = @spherical;

% set kriging parameters
gridsize = 1;
max_p = 10;
%% -----------------------------

% apply the function
disp('Start kriging...');
res = kriging(xi, yi, zi, gridsize, model, range, sill, nugget, max_p);
disp('done!');

%% Task 2
% run IDW for comparison 
disp('running IDW...');
idw = inverse_distance(xi.', yi.', zi.', 1, 2, 10);
disp('done!');

% plot
figure;
subplot(1,2,1);
image(res.*1024);
colormap(viridis(2048));

title('Kriging result');
hold on;

% 
subplot(1,2,2);
image(idw.*1024);
colormap(viridis(2048));
title('IDW result');