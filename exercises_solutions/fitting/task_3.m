% Task 3 Variogram Fitting

% parameters from task_1:
r =  50;
C0 =  1.50;
b =  0.10;

data = readmatrix('experimental.csv');
bins = data(1, :);
n = length(bins);
gamma = data(2, :);

% generate a vector of 100 elements between 0 and max distance
maxh = bins(n);
h = linspace(0, maxh, 100);

% apply each model 
gamma_sph =  spherical(h, r, C0, b);
gamma_exp =  exponential(h, r, C0, b);
gamma_gaus = gaussian(h, r, C0, b);

%% plot

%figure;
plot(bins, gamma, 'ok', 'DisplayName', 'experimental');
hold on;
plot(h, gamma_sph, 'DisplayName', 'spherical');
plot(h, gamma_exp, '-g', 'DisplayName', 'exponential');
plot(h, gamma_gaus, '-r', 'DisplayName', 'gaussian');
hold off;
legend('Location', 'southeast', 'Orientation', 'vertical');
