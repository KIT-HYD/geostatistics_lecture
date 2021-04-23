function y=synthetic_signal(m, amp, n_steps, t_step, lambda)
  % sythetic_signal produce a sine based sythetic signal
  %
  %  Arguements
  %  ----------
  %  m        double, expectation value of the signal
  %  amp      double, amplitude of the sine part
  %  n_steps  int64, length of the resulting signal
  %  t_step   double, one timestep as fraction of lambda needed to form one tau
  %  lambda   int16, duration of one period
  %  
  %  Returns
  %  -------
  %  y        (1, t_steps) shaped matrix of signal
  %
  s = 5;
  n = 2;
  
  % build t
  t = [0:t_step:n_steps*t_step - t_step];
  
  y = m + amp*sin(2*pi*t/lambda) + s*(ones(1, n_steps) - n*rand(1, n_steps));
end
