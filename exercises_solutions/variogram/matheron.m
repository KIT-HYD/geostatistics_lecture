function gamma=matheron(x)
  % matheron - calculate the Matheron semi-variance
  %
  % Calculates the Matheron semi-variance of the given 1D array.
  % The array has to give the deviations in value for all xi at a 
  % defined lag h. 
  % 
  %  Parameters
  %  ----------
  %  x  array, 1D, all pairwise differences in value for all point pairs at a 
  %                given lag h
  %
  %  Returns
  %  -------
  %  gamma  double, Matheron semi-variance of x
  
  % SOLUTION START
  N = length(x);
  gamma = (1 / (2*N)) * sum(x.^2);
  % SOLUTION END
end
