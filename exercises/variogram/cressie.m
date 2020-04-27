function gamma=cressie(x)
  % cressie - calculate the Cressie-Hawkins semi-variance
  %
  % Calculates the Cressie-Hawkins semi-variance of the given 1D array.
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
  %  gamma  double, Cressie-Hawkins semi-variance of x
  
  gamma = mean(abs(x));
end
