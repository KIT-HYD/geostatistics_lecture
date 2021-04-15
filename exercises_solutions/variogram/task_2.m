% Task 2

% parameters:
n_classes = 4;
%
data = dlmread('PREC_GAUGE_COOR.csv', ' ');
X = data(:,2:3);
values = data(:,4);

% calculate the distance matrix array for the coordinates and values
d = distances(X);
v = diffs(values);

% get the  maximum distance
maxd = max(d)

bins = linspace(0, maxd, n_classes + 1);

% calculate
gamma = ones(1, n_classes) * NaN;

for i=2:length(bins)
  samp = v((d > bins(i - 1)) & (d <= bins(i)));
  if length(samp) > 1
    gamma(i -1) = matheron(samp);
  end
end

% plot
figure;
plot(bins(2:n_classes + 1), gamma, 'o-r');
title('Variogram');
xlabel('lag');
ylabel('semi-variance');