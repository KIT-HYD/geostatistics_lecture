% Task 3

data = dlmread('PREC_GAUGE_COOR.csv', ' ');
X = data(:,2:3);

%     A
%---------------
dists = distance_matrix(X)
max(dists(:))
min(dists(dists > 0))

% distances are between 750 and 3000 meter

%     B
%---------------
hist(distances(X))


%     C
%---------------
n_classes = 4;                         % test different numbers
[c, e] = hist(distances(X), n_classes);
figure;
bar(c);