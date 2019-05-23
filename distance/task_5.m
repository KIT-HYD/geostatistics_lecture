% Task 5

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
means = ones(1, n_classes) * NaN;
vars = ones(1, n_classes) * NaN;

for i=2:length(bins)
  samp = v((d > bins(i - 1)) & (d <= bins(i)));
  if length(samp) > 1
    means(i -1) = mean(samp);
    vars(i -1) = var(samp);
  end
end

% plot
figure;
subplot(2,1,1);
plot(bins(2:n_classes + 1), means, 'o-r');
title('Lag class means');
xlabel('lag');
ylabel('mean pairwise differences');

subplot(2,1,2);
plot(bins(2:n_classes + 1), vars, 'o-g');
title('Lag class variances');
xlabel('lag');
ylabel('pairwise difference variance');
