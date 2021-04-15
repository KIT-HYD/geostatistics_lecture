% TASK 3
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

% plot
figure;
plot(bins(2:n_classes + 1), gamma, 'o-r');
title('Matheron');
xlabel('lag');
ylabel('semi-variance');

%% from the image above we choose the three variogram parameters
r  = 50
C0 = 1.1
b  = 0.5
data = [bins(2:n_classes + 1); gamma];
dlmwrite('experimental.csv', data, ',');
disp('Saved experimental variogram to CSV.');