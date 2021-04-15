function gamma=exponential(h, r, C0, b)
  % exponential - calculate the spherical variogram model
  %
  % Calculates the semi-variance value for a given lag h using the exponential 
  % variogram model. The model is parameterized using the three variogram 
  % parameters range (r), sill (C0) and nugget (b). 
  % 
  %  Parameters
  %  ----------
  %  x  number, lag, at which the semi-variance shall be calculated
  %  r  number, effective range of the variogram model
  %  C0 number, sill of the variogram model
  %  b  number, nugget effect of the variogram model
  %
  %  Returns
  %  -------
  %  gamma  double, semi-variance at lag h
  
  % REPLACE FROM HERE
  %gamma = 0.42 * C0;
  % TO HERE
  a = r / 3.;
  gamma = b + C0 * (1 - exp(-h / a) );
end