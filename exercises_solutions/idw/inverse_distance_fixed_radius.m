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
  %  r      Search radius in corrdinate system units
  %
  %  Returns
  %  -------
  %  v      double, the interpolated value
  %
  
  % check radius
  if r <= 0
    error('the raidus has to be positive');
  end
  
  % check corrdinate arrays
  if length(xi) ~= length(yi)
    error('The coordinate arrays do not have the same size');
  end 
  
  % SOLUTION START
  d = sqrt((xi - x).^2 + (yi - y).^2);
  d_in = d(d <= r);
  
  % if no points in radius, return nan
  if d_in == 0
    v = NaN;
    return
  end
  
  v = sum(vi(d <= r) ./ d_in) / sum(ones(1, length(d_in)) ./ d_in);
  % SOLUTION END
end
