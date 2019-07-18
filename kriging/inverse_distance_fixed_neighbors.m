function v = inverse_distance_fixed_neighbors(xi, yi, vi, x, y, n)
  % inverse_distance_fixed_neighbors  Calculate inverse distance weighted mean
  % 
  %  Put your documentation here.
  %
  %  Arguments
  %  ---------
  %  xi,yi  Coordinate arrays (1D)
  %  vi     Value array for all [xi, yi]
  %  x, y   Coordinates for the point of interese
  %  n      Number of closest neighbors to be used
  %
  %  Returns
  %  -------
  %  v      double, the interpolated value
  %
  
  % check radius
  if n <= 0
    error('the number of neighbors has to be positive');
  end
  
  % check corrdinate arrays
  if length(xi) ~= length(yi)
    error('The coordinate arrays do not have the same size');
  end 
  
  % SOLUTION START
  d = sqrt((xi - x).^2 + (yi - y).^2);
  [sorted_d idx] = sort(d);
  d_in = sorted_d(1:n);
  
  v = sum(vi(idx)(1:n) ./ d_in) / sum(ones(1, length(d_in)) ./ d_in );
  
  % SOLUTION END
end