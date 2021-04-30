% TASK 1 Variogram Fitting
% parameters:
n_classes = 10;
%
data = readmatrix('artificial.csv');
X = data(:,1:2);
values = data(:,3);

% calculate the distance matrix array for the coordinates and values
d = distances(X);
v = diffs(values);

% get the  maximum distance
maxd = max(d);

bins = linspace(0, maxd, n_classes + 1);

% calculate
gamma = ones(1, n_classes) * NaN;

for i=2:length(bins)
  samp = v((d > bins(i - 1)) & (d <= bins(i)));
  if length(samp) > 1
    gamma(i -1) = matheron(samp);
  end
end

%% plot

%figure;
plot(bins(2:n_classes + 1), gamma, 'o-r');
axis([0 maxd*1.03 0 2])                  % set axes limits
title('Matheron');
xlabel('lag');
ylabel('semi-variance');

%% from the image above we choose the three variogram parameters
r  = 50             % range
C0 = 1.5            % partial sill
b  = 0.1            % nugget

% plot range
line([r r], [0 2])
text(r+2,1 ,'range')

% plot sill
line([0 maxd], [C0+b C0+b])
text(maxd, 1.05*C0+b ,'sill + nugget','HorizontalAlignment', 'right')

% mark nugget
text(1, b ,'nugget')

% save data
expvgdata = [bins(2:n_classes + 1); gamma];
writematrix(expvgdata,'experimental.csv');
disp('Saved experimental variogram to CSV.');