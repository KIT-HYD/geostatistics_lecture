%% sampling.m
pkg load statistics

% synthetic soil moisture dataset
soil_moisture = randn(500000,1) .* 5 + 25;

% calculate statisitcal moments
sprintf('Mean: %.2f', average(soil_moisture))
sprintf('STD: %.3f' ,standard_deviation(soil_moisture))
sprintf('VAR: %.3f', variance(soil_moisture))
[count, edges] = histogram_counts(soil_moisture, 50);

% plot the histogram
figure;
subplot(2,4,1);
bar(count);
title('Soil moisture');

%% PUT YOUR CODE HERE
% randsample is the Octave function, as datasample is not yet implemented

sampling_sizes = [15, 25, 50, 100, 1000, 5000, 50000];

sample_means = ones(1, length(sampling_sizes));
sample_stds = ones(1, length(sampling_sizes));

% calculate statistics for all sample sizes 
i = 1;
for s=sampling_sizes
  % sample
  samp = randsample(soil_moisture, s);
  sample_means(i) = average(samp);
  sample_stds(i) = standard_deviation(samp);
  
  % print
  sprintf('Sample size of %d', s)
  sprintf('Mean: %.2f', average(samp))
  sprintf('STD: %.3f' ,standard_deviation(samp))
  sprintf('VAR: %.3f', variance(samp))
  
  %figure
  subplot(2,4,(i+1));
  [c, e] = histogram_counts(samp, 50);
  bar(c);
  title(['sample size ', num2str(s)]);
  i = i + 1;
end

% plot the mean and std of every sample
figure;
subplot(2,1,1);
plot(sampling_sizes, sample_means, '.-r');
set(gca, 'XScale', 'log');
title('Sample means');
subplot(2,1,2);
plot(sampling_sizes, sample_stds, '.-r');
set(gca, 'XScale', 'log');
title('Sample standard deviations');