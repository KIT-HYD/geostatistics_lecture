%% Task 1

% read the data
data = readmatrix('artificial.csv');

% % % % check for duplicates to avoid NaN in the final result
% %     % (singular matrices will result in NaN) 
% % here: checked.
% [~,i] = unique(sort(data,2),'first','rows');
% data = data(i,:);

xi = data(:, 1);
yi = data(:, 2);
zi = data(:, 3);


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

% figure;
disp('plotting ...');
subplot(1,2,1);

% scaled image, with coordinates for plotting of points
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


