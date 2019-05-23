% temperature study

% -----------------------------------------------
step = 0.1;
n_steps = 2400;

% create two temeprature timeseries
% first argument is the expectation value, second the amplitude
y1 = synthetic_signal(22, 20, n_steps, step);
y2 = synthetic_signal(19, 12, n_steps, step);
% -----------------------------------------------

t = [0:step:step*n_steps-step];
figure;
ax1 = subplot(3,3, [1 2 3]);
plot(t, y1, 'r--');
hold on;
plot(t, y2, 'b--');
title('Temperature signal');
xlabel('Time');
ylabel('Temperature [deg. C]');

ax2 = subplot(3, 3 , [4 5 7 8]);
plot(y1, y2, 'go'); 
title(['Correlation of y1 and y2: ', num2str(corrcoef(y1, y2)(1,2))]);
xlabel('y1');
ylabel('y2');


ax3 = subplot(3,3,6);
hist(y1, 25);
title(sprintf('y1  m=%.2f  std=%.2f', mean(y1), std(y1)));

ax4 = subplot(3,3,9);
hist(y2, 25);
title(sprintf('y2  m=%.2f  std=%.2f', mean(y2), std(y2)));