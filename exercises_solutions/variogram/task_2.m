% Task 2

% parameters: number of bins, can be varied
n_classes = 4;
%
datav1 = readmatrix('PREC_GAUGE_COOR.csv');
X1 = datav1(:,2:3);
values1 = datav1(:,4);

% calculate the distance matrix array for the coordinates and values
d1 = distances(X1);
v1 = diffs(values1);

% get the  maximum distance
maxd1 = max(d1);

% edges of bins (one more than bins)
edges1 = linspace(0, maxd1, n_classes + 1);

% calculate
gamma_m1 = ones(1, n_classes) * NaN;

for i=2:length(edges1)
  samp = v1((d1 > edges1(i - 1)) & (d1 <= edges1(i)));
  if length(samp) > 1
    gamma_m1(i -1) = matheron(samp);
  end
end

%% plot
% figure;
plot(edges1(2:n_classes + 1), gamma_m1, 'o-r');
title('Variogram (Matheron)');
xlabel('lag');
ylabel('semi-variance');