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
  
  % check for points inside radius
  if any(d <= r)
      d_in = d(d <= r);
  else
  % if no points in radius, return nan
    v = NaN;
    return
  end
  
  % check if point to be interpolated is a sampling point (distance 0)
  if any(d_in == 0)
      % then use observed value
       v = vi(find(d==0));
  % else interpolate point
  else
      v = sum(vi(d <= r) ./ d_in) / sum(ones(1, length(d_in)) ./ d_in);
  end
  % SOLUTION END
end
