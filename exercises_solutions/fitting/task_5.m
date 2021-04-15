% Task 5
pkg load optim;

% parameters from task 4
r_s =  55;
C0_s =  1.6;
b_s =  0.0;
r_e = 65;
C0_e = 1.5;
b_e = 0.1;
r_g = 70;
C0_g = 1.1;
b_g = 0.5;

data = dlmread('experimental.csv', ',');
bins = data(1, :);
n = length(bins);
gamma = data(2, :);

% apply the models to an 0:max(bins) array of 100 elements
maxh = bins(n);
h = linspace(0, maxh, 100);

% apply models to user parameters 
gamma_sph =  arrayfun(@spherical, h, r_s, C0_s, b_s);
gamma_exp =  arrayfun(@exponential, h, r_e, C0_e, b_e);
gamma_gaus = arrayfun(@gaussian, h, r_g, C0_g, b_g);

%%--------------------------------
% Use Least squares to fit 

%%--------------------------------
% define lower, upper bound and initial guess for parameters
lo = [30, 0.001, 0];    % lower bounds, use 30 for r, otherwise nugget effect vars. are found
hi = [max(bins), max(gamma), max(gamma)];
x0 = [mean(bins) mean(gamma) 0];

% wrap the models, 
% this may be done in a nicer way, I still think to pythonic
sph =  @(param, h) arrayfun(@spherical, h, param(1), param(2), param(3));
expo = @(param, h) arrayfun(@exponential, h, param(1), param(2), param(3));
gaus = @(param, h) arrayfun(@gaussian, h, param(1), param(2), param(3));

% optimize parameters using least squares
param_s = lsqcurvefit(sph, x0, bins, gamma, lo, hi)
param_e = lsqcurvefit(expo, x0, bins, gamma, lo, hi)
param_g = lsqcurvefit(gaus, x0, bins, gamma, lo, hi)

% apply optimized models
gamma_opt_sph = arrayfun(@spherical, h, param_s(1), param_s(2), param_s(3));
gamma_opt_exp = arrayfun(@exponential, h, param_e(1), param_e(2), param_e(3));
gamma_opt_gaus = arrayfun(@gaussian, h, param_g(1), param_g(2), param_g(3));

% plot
figure;
subplot(1,2,1);
plot(bins, gamma, 'ok', 'DisplayName', 'experimental');
hold on;
plot(h, gamma_sph, 'DisplayName', 'spherical');
plot(h, gamma_exp, '-g', 'DisplayName', 'exponential');
plot(h, gamma_gaus, '-r', 'DisplayName', 'gaussian');
hold off;
legend('Location', 'southeast', 'Orientation', 'horizontal');
title('Manual fit');

subplot(1,2,2);
plot(bins, gamma, 'ok', 'DisplayName', 'experimental');
hold on;
plot(h, gamma_opt_sph, 'DisplayName', 'spherical');
plot(h, gamma_opt_exp, '-g', 'DisplayName', 'exponential');
plot(h, gamma_opt_gaus', '-r', 'DisplayName', 'gaussian');
hold off;
legend('Location', 'southeast', 'Orientation', 'horizontal');
title('Least squares fit');