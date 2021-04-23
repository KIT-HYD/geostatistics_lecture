function v = inverse_distance_fixed_radius(xi, yi, vi, x, y, r)
  % inverse_distance_fixed_radius  Calculate inverse distance weighted mean
  % 
  %  Put your documentation here.
  %
  %  Arguments
  %  ---------
  %  xi,yi  Coordinate arrays (1D)
  %  vi     Value array for all [xi, yi]
  %  x, y   Coordinates for the point of interese
  %  r      Search radius in coordinate system units
  %
  %  Returns
  %  -------
  %  v      double, the interpolated value
  %
  
  % check radius
  if r <= 0
    error('The radius has to be positive');
  end
  
  % check corrdinate arrays
  if length(xi) ~= length(yi)
    error('The coordinate arrays do not have the same size');
  end 
  
  % REPLACE FROM HERE
  v = mean(vi);
  % TO HERE
end
