% Task 3

% parameters: number of bins, can be varied
n_classes = 10;

% read 'artificial' data
datav2 = readmatrix('artificial.csv');
X2 = datav2(:,1:2);
values2 = datav2(:,3);

% calculate the distance matrix array for the coordinates and values
d2 = distances(X2);
v2 = diffs(values2);

% get the  maximum distance
maxd2 = max(d2);

% edges of bins (one more than bins)
edges2 = linspace(0, maxd2, n_classes + 1);

% calculate using the matheron estimator _m 
gamma_m2 = ones(1, n_classes) * NaN;

for i=2:length(edges2)
  samp = v2((d2 > edges2(i - 1)) & (d2 <= edges2(i)));
  if length(samp) > 1
    gamma_m2(i -1) = matheron(samp);
  end
end

%% plot
%figure;
plot(edges2(2:n_classes + 1), gamma_m2, 'o-r');
title('Matheron');
xlabel('lag');
ylabel('semi-variance');

