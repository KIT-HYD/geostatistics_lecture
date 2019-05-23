function s = standard_deviation(x)
  %  standard_deviation  Calculate standard deviation
  % 
  %  Arguments
  %  ---------
  %  x    1D array of sample input data
  %
  %  Returns
  %  -------
  %  s  double, the standard deviation of x
  %
  
  % SOLUTION START
  m = average(x);
  N = length(x);
  s = sqrt(sum((x - m).^2) / (N -1));
  % SOLUTION END
end
