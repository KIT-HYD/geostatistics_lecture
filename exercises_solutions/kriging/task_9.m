%% Task 9

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
gridsize = 2;      
min_p = 3;
max_p = 10;


%% -----------------------------

% apply the function 'kriging_with_minp'
disp('Start kriging with minp...');
[res, varres] = kriging_with_minp_and_var(xi, yi, zi, gridsize, model, range, sill, nugget, min_p, max_p);
disp('done!');


%% plot
% figure;

% image 
subplot(1,2,1) 
 krigim = imagesc(res.*1024);
 title('Kriging result');
  colormap(parula(1024));
  % set NaN values to transparent
  krigim.AlphaData= ~isnan(krigim.CData);  
 colorbar
 % scale x and y equally
 set(gca,'DataAspectRatio',[1 1 1])

subplot(1,2,2)
  kvim = imagesc(varres.*1024);
  title('Kriging variance');
   colormap(parula(1024));
   % set NaN values to transparent
   kvim.AlphaData= ~isnan(kvim.CData);  
  colorbar
  % scale x and y equally
  set(gca,'DataAspectRatio',[1 1 1])
 
  disp('plotting done ...');





