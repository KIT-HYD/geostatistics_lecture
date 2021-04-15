% Task 3

% parameters from task_1:
r =  50
C0 =  1.1000
b =  0.50000

data = dlmread('experimental.csv', ',');
bins = data(1, :);
n = length(bins);
gamma = data(2, :);

% apply the models to an 0:max(bins) array of 100 elements
maxh = bins(n);
h = linspace(0, maxh, 100);

% apply models 
gamma_sph =  arrayfun(@spherical, h, r, C0, b);
gamma_exp =  arrayfun(@exponential, h, r, C0, b);
gamma_gaus = arrayfun(@gaussian, h, r, C0, b);

% plot
figure;
plot(bins, gamma, 'ok', 'DisplayName', 'experimental');
hold on;
plot(h, gamma_sph, 'DisplayName', 'spherical');
plot(h, gamma_exp, '-g', 'DisplayName', 'exponential');
plot(h, gamma_gaus, '-r', 'DisplayName', 'gaussian');
hold off;
legend('Location', 'southeast', 'Orientation', 'horizontal');