% Task 4

%% ---------------------------------------
% Change these parameters:
disp('Spherical parameters:');
r_s =  55
C0_s =  1.6
b_s =  0.0
disp('Exponential parameters:');
r_e = 65
C0_e = 1.5
b_e = 0.1
disp('Gaussian parameters:');
r_g = 70
C0_g = 1.1
b_g = 0.5

%% ---------------------------------------
data = readmatrix('experimental.csv');
bins = data(1, :);
n = length(bins);
gamma = data(2, :);

% generate a vector of 100 elements between 0 and max distance
maxh = bins(n);
h = linspace(0, maxh, 100);

% apply models 
gamma_sph =  spherical( h, r_s, C0_s, b_s);
gamma_exp =  exponential( h, r_e, C0_e, b_e);
gamma_gaus = gaussian( h, r_g, C0_g, b_g);

%% plot

% figure;
plot(bins, gamma, 'ok', 'DisplayName', 'experimental');
hold on;
plot(h, gamma_sph, 'DisplayName', 'spherical');
plot(h, gamma_exp, '-g', 'DisplayName', 'exponential');
plot(h, gamma_gaus, '-r', 'DisplayName', 'gaussian');
hold off;
legend('Location', 'southeast', 'Orientation', 'vertical');
