function gamma=spherical(h, r, C0, b)
  % spherical - calculate the spherical variogram model
  %
  % Calculates the semi-variance value for a given lag h using the spherical 
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
  
a = r;
gamma = ones(1, length(h));
gamma(h <= r)= b + C0 * ( ((3 * h(h <= r)) / (2 * a)) - (0.5 * (h(h <= r)/a).^3) );
gamma(h > r) = C0 + b; 
end
