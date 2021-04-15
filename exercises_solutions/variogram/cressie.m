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
  
  % SOLUTION START
  N = length(x);
  
  % dismantle cresssie into 2 terms
  term1 = (1/N) * sum(sqrt(abs(x)));
  term2 = 0.457 + (0.494 / N) + (0.045/N.^2);
  gamma =  0.5 * term1.^4 / term2;
  % SOLUTION END
end
