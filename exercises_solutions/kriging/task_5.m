%% Task 5

% read the data
data = readmatrix('artificial.csv');
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
min_p = 4;
max_p = 10;


%% -----------------------------

% apply the function 'kriging_with_minp'
disp('Start kriging with minp...');
res = kriging_with_minp(xi, yi, zi, gridsize, model, range, sill, nugget, min_p, max_p);
disp('done!');


%% plot
% figure;

% image 
 krigim = imagesc(res.*1024);
 colormap(parula(2048));
     % set NaN values to transparent
     krigim.AlphaData= ~isnan(krigim.CData);  
 title('Kriging result with minp');

 disp('plotting done ...');





