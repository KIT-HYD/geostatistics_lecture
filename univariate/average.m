function m = average(x)
  %  average  Calculate arithmetric mean
  % 
  %  Arguments
  %  ---------
  %  x    1D array of sample input data
  %
  %  Returns
  %  -------
  %  m  double, the mean of x
  %
  
  % SOLUTION START
  N = length(x);
  m = sum(x) / N;
  % SOLUTION END
end
