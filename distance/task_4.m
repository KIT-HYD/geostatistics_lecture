% Task 4

data = dlmread('PREC_GAUGE_COOR.csv', ' ');
X = data(:,2:3);
values = data(:,4);

% create a 'distance' matrix array for values
v = diffs(values);

% create distance matrix array
d = distances(X);

figure;
plot(d, v, 'og');
grid;
xlabel('separating distance');
ylabel('observations difference');


