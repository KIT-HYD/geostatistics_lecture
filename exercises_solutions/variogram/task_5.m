% Task 5

% parameters:
n_classes = 10;
%
data = dlmread('artificial.csv', ',');
X = data(:,1:2);
values = data(:,3);

% calculate the distance matrix array for the coordinates and values
d = distances(X);
v = diffs(values);

% get the  maximum distance
maxd = max(d)

bins = linspace(0, maxd, n_classes + 1);

% calculate
gamma_m = ones(1, n_classes) * NaN;
gamma_c = ones(1, n_classes) * NaN;

for i=2:length(bins)
  samp = v((d > bins(i - 1)) & (d <= bins(i)));
  if length(samp) > 1
    gamma_m(i -1) = matheron(samp);
    gamma_c(i -1) = cressie(samp);
  end
end

% plot
figure;
subplot(1, 2, 1);
plot(bins(2:n_classes + 1), gamma_m, 'o-r');
title('Matheron');
xlabel('lag');
ylabel('semi-variance');

subplot(1, 2, 2);
plot(bins(2:n_classes + 1), gamma_c, 'o-r');
title('Cressie-Hawkins');
xlabel('lag');
ylabel('semi-variance');