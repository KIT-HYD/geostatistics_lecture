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
  
  % REPLACE FROM HERE
  b = []
  for i  = 1:length(xi)
       
      b = [b, sqrt(abs(x-xi(i))^2 + abs(y-yi(i))^2)]
  
  end
  
  d= []
  va = []
  ve = vi
  for i = 1:n
     
      d = [d, min(b)]
     
     e = find(b==min(b))
     
     va = [va, ve(e)]
     
     b(e) = []
     ve(e) = []
     
     

  end
  
  % Interpolation
  vx = 0
  vy = 0
  for i = 1:length(va)
    vx = vx + va(i)/d(i)
    vy = vy + 1/d(i)
  end
  
    v = vx/vy
  
  %v = mean(vi)
  % UNTIL HERE
end