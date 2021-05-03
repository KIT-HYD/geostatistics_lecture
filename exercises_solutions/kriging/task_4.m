%% Task 4

% read the data
data = readmatrix('artificial.csv');
xi = data(:, 1);
yi = data(:, 2);
zi = data(:, 3);

%% -----------------------------
%% Set the parameters here
% My best parameter set
my_range = 55;
my_sill = 1.6;
my_nugget = 0.0;

% lsq best parameter set
lsq_range = 51.89022
lsq_sill = 1.37203
lsq_nugget = 0.00000
    
% set the model
model = @spherical;

% set kriging parameters
gridsize = 1;
max_p = 10;
%% -----------------------------

% apply the function
disp('Start kriging with my parameters...');
my_res = kriging(xi, yi, zi, gridsize, model, my_range, my_sill, my_nugget, max_p);
disp('done!');

disp('Start kriging with LSQ parameters...');
lsq_res = kriging(xi, yi, zi, gridsize, model, lsq_range, lsq_sill, lsq_nugget, max_p);
disp('done!');

%% plot

% figure;
disp('plotting ...');
subplot(1,2,1);
imagesc(my_res.*1024);
colormap(parula(2048));

title(sprintf('range: %.2f  sill: %.2f   nugget: %.1f', my_range, my_sill, my_nugget));

% 
subplot(1,2,2);
imagesc(lsq_res.*1024);
colormap(parula(2048));
title(sprintf('range: %.2f  sill: %.2f   nugget: %.1f', lsq_range, lsq_sill, lsq_nugget));