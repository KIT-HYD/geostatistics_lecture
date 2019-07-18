%% Task 6
pkg load statistics % you may need to uncomment this is Matlab
warning('off', 'all');

% read the data
data = dlmread('artificial.csv', ',');
xi = data(:, 1);
yi = data(:, 2);
zi = data(:, 3);

%% -----------------------------
%% Set the parameters here
% spherical parameter set
s_range = 51.89022;
s_sill = 1.37203;
s_nugget = 0.00000;

% exponential parameter set
e_range = 5.5986e+01;
e_sill = 1.3785e+00;
e_nugget = 3.8862e-17;

% gaissian parameter set
g_range = 4.5870e+01;
g_sill = 1.3707e+00;
g_nugget = 5.5511e-17;


% set kriging parameters
gridsize = 1;
max_p = 10;
%% -----------------------------

% apply the spherical function
disp('Start kriging with spherical variogram...');
s_res = kriging(xi, yi, zi, gridsize, @spherical, s_range, s_sill, s_nugget, max_p);
disp('done!');

% apply the exponential function
disp('Start kriging with exponential variogram...');
e_res = kriging(xi, yi, zi, gridsize, @exponential, e_range, e_sill, e_nugget, max_p);
disp('done!');

% apply the gaussian function
disp('Start kriging with gaussian variogram...');
g_res = kriging(xi, yi, zi, gridsize, @gaussian, g_range, g_sill, g_nugget, max_p);
disp('done!');

% plot 1
figure;
subplot(1,3,1);
image(s_res.*1024);
colormap(viridis(2048));

title(sprintf('Spherical range: %.2f  sill: %.2f   nugget: %.1f', s_range, s_sill, s_nugget));
hold on;

% plot 2
subplot(1,3,2);
image(e_res.*1024);
colormap(viridis(2048));

title(sprintf('Exponential range: %.2f  sill: %.2f   nugget: %.1f', e_range, e_sill, e_nugget));
hold on;

% plot 3
subplot(1,3,3);
image(g_res.*1024);
colormap(viridis(2048));

title(sprintf('Gaussian range: %.2f  sill: %.2f   nugget: %.1f', g_range, g_sill, g_nugget));
