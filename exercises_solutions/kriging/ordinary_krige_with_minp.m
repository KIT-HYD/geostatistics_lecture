function z=ordinary_krige_with_minp(xi, yi, zi, x, y, variogram, range, sill, nugget, min_p, max_p)
  % ordinary_krige Point based kriging function
  %
  % This function claculates the kriging interpolation result of point (x,y). 
  % The @variogram model is used with the given parameters (range, sill, nugget) 
  % to calculate weights for the given observations (xi, yi, zi) and returns
  % the weighted mean.
  %
  % Parameters
  % ----------
  %  xi,yi       Coordinate arrays (1D)
  %  zi          Value array for all [xi, yi]
  %  x, y        Coordinates of the point of interest
  %  variogram   Variogram model. (@gaussian, @spherical, @expoonential)
  %  range       range parameter of the variogram model
  %  sill        sill parameter of the variogram model
  %  nugget      nugget parameter of the variogram model
  %  min_p       Minimum number of neighbors to use
  %  max_p       Maxmium number of neighbors to use
  %
  %  Returns
  %  -------
  %  z           double, the interpolated value
  %
  N = length(xi);
  if N ~= length(yi) || N ~= length(zi)
    error('Input data has to be of same dimension');
  end
  
  % get the max_p closest neighbors
  d = sqrt((xi -x).^2 + (yi - y).^2);
  [sorted_d, idx] = sort(d);
  
  % PLACE YOUR ARGUMENT BASED SOLUTION HERE  
  % get the distances and the index of points to be used
  d_in = sorted_d(sorted_d < range);
  idx_in = idx(sorted_d < range);
  
  if length(d_in) < min_p
    z = NaN;
    return
  elseif length(d_in) > max_p
    idx_in = idx(1:max_p);
  end
  
  % find the neighbors
  x_in = xi(idx_in);
  y_in = yi(idx_in);
  z_in = zi(idx_in);
  n = length(idx_in);
  
  % if not enough points are found, return NaN
  if n < min_p
    z = NaN;
    return 
  end
  % TO HERE
  
  %% build the kriging matrix
  % code is bit different from ordinary_krige.m, but does basically the same
  D = squareform(pdist([x_in y_in]));
  
  % map distances to semi-variances
  wrapper = @(h) variogram(h, range,sill,nugget); 
  A = arrayfun(wrapper, D);
  
  % append row and col of ones
  A = [A; ones(1, n)];
  A = [A ones(n+1, 1)];
  A(n + 1, n + 1) = 0;
  
  % construct B, 
  % get the distance to POI
  d_poi = pdist([[x; x_in] [y; y_in]]);
  d_poi = d_poi(1:n);
  B = [arrayfun(wrapper, d_poi) 1];
  
  % solve the linear equation system of A and right side of B
  w = linsolve(A.', B.'); 
  
  % the estimate is the dot product of the weights and the values
  z = dot(w(1:n), z_in);
end
