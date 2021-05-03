% Task 7

% based on Task 5

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
gridsize = 3;      


%% -----------------------------
% Default case
min_p = 3;
max_p = 15;

% apply the function 'kriging_with_minp'
disp('Start kriging with minp...');
res = kriging_with_minp(xi, yi, zi, gridsize, model, range, sill, nugget, min_p, max_p);
disp('done!');


%% start simple monte carlo analysis
% Vary min_p and max_p in a defined range, and compare results to default
% case

% min numbers to test
mintest = 2:6;
%max numbers to test
maxtest = [8, 10, 15, 20];  %  testing a range like 5:15 would work, but need more time

% empty container for results
allres = cell(length(mintest), length(maxtest)); 

% calculate all results in a nested loop
for jj = 1: length(mintest)
    for kk = 1: length(maxtest)
        fprintf('Calculating for %1d min points and %1d max points\n', mintest(jj), maxtest(kk));
       tic;
       allres{jj, kk} = kriging_with_minp(xi, yi, zi, gridsize, model, range, sill, nugget, mintest(jj), maxtest(kk)); 
       toc   
    end
end

%%
% calculate root mean squared error RMSE compared to default case 
gof = cellfun(@(x) sqrt(mean((x-res).^2, 'all')), allres) ; 

%% plot(allres);
[ni, na] = size(allres);

for jj = 1: ni*na
   subplot(ni, na, jj)
   imagesc(allres{jj}*1024);
   colormap(parula(2048)); 
end
    % Create textarrows
    annotation('textarrow',[0.05 0.05],...
        [0.87 0.78],'String',{'min p'});
    annotation('textarrow',[0.15 0.24],...
        [0.96 0.96],'String',{'max p'});

% % NOTE
% changing min_p has no effect (in this range) - there are always more
% points
% changing max_p has some effects - see gof above
