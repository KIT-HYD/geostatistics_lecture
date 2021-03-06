% Task 5

%% Parameters and code from task 4
r_s =  55;
C0_s =  1.6;
b_s =  0.0;
r_e = 65;
C0_e = 1.5;
b_e = 0.1;
r_g = 70;
C0_g = 1.1;
b_g = 0.5;

data = readmatrix('experimental.csv');
bins = data(1, :);
n = length(bins);
gamma = data(2, :);

% apply the models to an 0:max(bins) array of 100 elements
maxh = bins(n);
h = linspace(0, maxh, 100);

% apply models with given parameters
gamma_sph =  spherical(h, r_s, C0_s, b_s);
gamma_exp =  exponential(h, r_e, C0_e, b_e);
gamma_gaus = gaussian(h, r_g, C0_g, b_g);

%% --------------------------------
% Use Least squares to fit 

%%--------------------------------
% define lower, upper bound and initial guess for parameters
lo = [30, 0.001, 0];                        % lower bounds; 
hi = [max(bins), max(gamma), max(gamma)];   % upper bounds
x0 = [mean(bins) mean(gamma) 0];            % starting parameters

% wrap the models in an anonymous function for fitting (see 'help lsqcurvefit' 
sph =  @(param, bins) spherical(bins, param(1), param(2), param(3));
expo = @(param, bins) exponential(bins, param(1), param(2), param(3));
gaus = @(param, bins) gaussian(bins, param(1), param(2), param(3));

% optimize parameters using least squares
param_s = lsqcurvefit(sph, x0, bins, gamma, lo, hi)
param_e = lsqcurvefit(expo, x0, bins, gamma, lo, hi)
param_g = lsqcurvefit(gaus, x0, bins, gamma, lo, hi)

% apply optimized models
gamma_opt_sph = spherical(h, param_s(1), param_s(2), param_s(3));
gamma_opt_exp = exponential(h, param_e(1), param_e(2), param_e(3));
gamma_opt_gaus = gaussian(h, param_g(1), param_g(2), param_g(3));

%% plot
 %figure;
subplot(1,2,1);
plot(bins, gamma, 'ok', 'DisplayName', 'experimental');
hold on;
plot(h, gamma_sph, 'DisplayName', 'spherical');
plot(h, gamma_exp, '-g', 'DisplayName', 'exponential');
plot(h, gamma_gaus, '-r', 'DisplayName', 'gaussian');
hold off;
legend('Location', 'southeast', 'Orientation', 'vertical');
title('Manual fit');

subplot(1,2,2);
plot(bins, gamma, 'ok', 'DisplayName', 'experimental');
hold on;
plot(h, gamma_opt_sph, 'DisplayName', 'spherical');
plot(h, gamma_opt_exp, '-g', 'DisplayName', 'exponential');
plot(h, gamma_opt_gaus', '-r', 'DisplayName', 'gaussian');
hold off;
legend('Location', 'southeast', 'Orientation', 'vertical');
title('Least squares fit');