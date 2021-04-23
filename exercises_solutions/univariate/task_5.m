%Task 5
% ---------
%     A
% ---------
data = synthetic_signal(22, 20, 2400, 0.1, 24);

% the circshift function is what we need
lagdata = circshift(data, 1);

cor_self = corrcoef(data, data);
cor_lag = corrcoef(data, lagdata); 

disp(sprintf('Correlation of data with itself: %.3f', cor_self(1,2) ));
disp(sprintf('Correlation of data with lag 1:  %.3f', cor_lag(1,2) ));


% ---------
%     B
% ---------
% lag=10
cor_lag10 = corrcoef(data, circshift(data, 10));
disp(sprintf('Correlation of data with lag 10:  %.3f', cor_lag10(1,2)));

% lag=100
cor_lag100 = corrcoef(data, circshift(data, 100));
disp(sprintf('Correlation of data with lag 100:  %.3f', cor_lag100(1,2) ));

% lag=500
cor_lag500 = corrcoef(data, circshift(data, 500));
disp(sprintf('Correlation of data with lag 500:  %.3f', cor_lag500(1,2)));



% ---------
%     C
% ---------
% store the correlation coefficients
N = length(data) - 1;
corrs = ones(1, N);

for i=1:N
    cor_lag = corrcoef(data, circshift(data, i));
    corrs(i) = cor_lag(1,2);
end

figure;
plot(1:N, corrs, '--b');
xlabel('Lag');
ylabel('correlation coeficient');
title('Autocorrelation');
