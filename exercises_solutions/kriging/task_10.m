% Task 10

%%
% read the data
data = readmatrix('artificial.csv');
xi = data(:, 1);
yi = data(:, 2);
zi = data(:, 3);


%% -----------------------------
%% Set the parameters here
% from the fitting exercise, we use some variogram parameters:
fitrange = 51.1;
fitsill = 1.37;
fitnugget = 0.0;

% set the model
model = @spherical;

% set kriging parameters
min_p = 4;
max_p = 10;


%% -----------------------------
% Crossvalidation
% apply the function 'kriging_with_minp' to all points and determine the
% interpolated value when leaving the point out of kriging
disp('Start kriging for points...');
res = pointkrig(xi, yi, zi, model, fitrange, fitsill, fitnugget, min_p, max_p);

%% plot observed vs. interpolated
% figure;
plot(zi, res, '+');
refl = refline(1,0);
    refl.Color = 'k';
    refl.LineStyle='--';
 title('Kriging interpolation vs. observed values');
 
 %% Goodness of Fit
 rmse = sqrt(mean((res - zi).^2));
 
 
 %% repeat for combinations of parameters
 
 % vary parameters - check with Variogram 
 nv = 10;
 rangevec = linspace(35, 65, nv);
 sillvec = linspace(1.2, 1.7, nv);
 nuggetvec = linspace(0, 0.5, nv);
 
 % all possible combinations of the range, sill, nugget
 parvec = combvec(rangevec, sillvec, nuggetvec)';

 
 %% apply function to all combinations and collect result in a cell array
 
 % function handle
 mparpk = @(ran, sil, nug) pointkrig(xi, yi, zi, model, ran, sil, nug, min_p, max_p);
 
%% CAUTION - takes a while, ~ 10 min
 
%  tic
%  rescont = arrayfun(mparpk, parvec(:,1), parvec(:,2), parvec(:,3), 'UniformOutput', false);
%  toc
%  
%  save parvariation.mat rescont
load parvariation.mat

 %%  RMSE
 rmsevec = cellfun(@(res) sqrt(mean((res - zi).^2)), rescont);
 
% interesting periodicity
 subplot(2,1,1)
 plot(rmsevec)
 
subplot(2,1,2)
    yyaxis left 
        plot(parvec(:,1))
        ax = gca;
        ax.YLim = [0 70];
    yyaxis right
        plot(parvec(:,2:3))
        ax = gca;
        ax.YLim = [0 5];

 %% Determine largest gradient in the error
 
 % reshape to a cube along the parameter variations
 rescube = reshape( rmsevec/rmse,10,10,10);
 % similar cube for indices to parvec 
 parrow = reshape( 1:length(parvec),10,10,10);
 
 % 1. Way
 % determine max gradients along each dimension
 % with changing sill, with changing range, with changing nugget
 gradsill = NaN(nv,1); gradran = NaN(nv,1); gradnug = NaN(nv,1); 
 for jj=1:nv
     [gx, gy ]= gradient(rescube(:,:,jj));
      gradsill(jj) = max(gx(:));                % sill changes along columns
      gradran(jj)= max(gy(:));                  % range changes along rows
     gz = gradient(rescube(:,jj,:));            % nugget changes along third dim
      gradnug(jj) = max(gz(:));
 end
 
 % where is the largest gradient -> most sensitive parameter
 max([gradsill, gradran, gradnug])
 
 
 %% 2. way 
 % determine the max diff in rmse along the dimensions
 gran = 0; gsil = 0; gnug = 0;
 for jj = 1:nv
     dy = range(rescube(:,:,jj));   % range along columns
     gran = max([gran; dy(:)]);
     dx = range(rescube(:,:,jj)');  % along rows
     gsil = max([gsil; dx(:)]);
     temp = rescube(:,jj,:);
     temp = reshape(temp, nv,nv);
     dz = range(temp');             % along third dim
     gnug = max([gnug; dz(:)]);
 end
 
 % greatest differences in results for sill, range, nugget
 [gsil gran gnug]
 

 
 
     
 
 
 
 
 
 
 
 

