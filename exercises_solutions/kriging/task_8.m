%% Task 8

% sscript based on task_1_2

% read the data
data = readmatrix('artificial.csv');

% keep only a quarter (a tenth, half, ...) of the data
n = floor(length(data)/10);

% run the script several times, and/or change parameters here, and compare figures
%       Or: edit the code to store results in different objects...

%
idx = randsample(1:length(data), n);
smalldat = data(idx,:);
xi = smalldat(:, 1);
yi = smalldat(:, 2);
zi = smalldat(:, 3);

%% -----------------------------
%% Set the parameters here
% from the fitting exercise, we use some variogram parameters:
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
idw = inverse_distance(xi.', yi.', zi.', gridsize, 2, 10);
disp('done!');

%% plot

figure;
disp('plotting ...');
subplot(1,2,1);

% image with coordinates  - for plotting of points
 krigim = imagesc([min(xi), max(xi)], [min(yi), max(yi)], res.*1024);
 colormap(parula(2048));
  % set NaN values to transparent
  krigim.AlphaData= ~isnan(krigim.CData);  
 title('Kriging result');
     % plot points on top
     hold on;
     plot(xi, yi, '+c')
     hold off   

subplot(1,2,2);
idwim = imagesc([min(xi), max(xi)], [min(yi), max(yi)], idw.*1024);
colormap(parula(2048));
 % set NaN values to transparent
 idwim.AlphaData= ~isnan(idwim.CData);  
title('IDW result');


