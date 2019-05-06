%% sampling.m

% synthetic soil moisture dataset
soil_moisture = randn(500000,1) .* 5 + 25;

% calculate statisitcal moments
sprintf('Mean: %.2f', average(soil_moisture))
sprintf('STD: %.3f' ,standard_deviation(soil_moisture))
sprintf('VAR: %.3f', variance(soil_moisture))
[count, edges] = histogram_counts(soil_moisture, 50);

% plot the histogram
figure;
bar(count);
title('Soil moisture');

%% PUT YOUR CODE HERE