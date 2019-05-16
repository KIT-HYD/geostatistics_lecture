%Task 5
% ---------
%     A
% ---------
data = synthetic_signal(22, 20, 2400, 0.1);

% the circshift function is what we need
disp(sprintf('Correlation of data with itself: %.3f', corrcoef(data, data)(1,2)));
disp(sprintf('Correlation of data with lag 1:  %.3f', corrcoef(data, circshift(data, 1))(1,2)));


% ---------
%     B
% ---------
% lag=10
disp(sprintf('Correlation of data with lag 1:  %.3f', corrcoef(data, circshift(data, 10))(1,2)));

% lag=100
disp(sprintf('Correlation of data with lag 1:  %.3f', corrcoef(data, circshift(data, 100))(1,2)));

% lag=500
disp(sprintf('Correlation of data with lag 1:  %.3f', corrcoef(data, circshift(data, 500))(1,2)));



% ---------
%     C
% ---------
% store the correlation coefficients
N = length(data) - 1;
corrs = ones(1, N);

for i=1:N
  corrs(i) = corrcoef(data, circshift(data, i))(1,2);
end

figure;
plot(1:N, corrs, '--b');
xlabel('Lag');
ylabel('correlation coeficient');
title('Autocorrelation');
