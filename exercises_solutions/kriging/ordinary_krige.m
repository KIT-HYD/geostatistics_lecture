function z=ordinary_krige(xi, yi, zi, x, y, variogram, range, sill, nugget, max_p)
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
  
  % get the indices of points to be used
  idx_in = idx(1:max_p);        
    d_in = sorted_d(1:max_p);           %  distances % not used
  
  % find the neighbors
  x_in = xi(idx_in);
  y_in = yi(idx_in);
  z_in = zi(idx_in);
  n = length(idx_in);
  
  % if not enough points are found, return NaN
  if n < 4
    z = NaN;
    disp('not enough points'); 
    return 
  end
 
%% % build the kriging matrix
  
% map distances to semi-variances using the function handle in 'variogram' 
  D = pdist([x_in y_in]);
  A = variogram(D, range,sill,nugget);
  A = squareform(A);                        % make square matrix of semivars

  % append row and col of ones
  A = [A; ones(1, n)];
  A = [A ones(n+1, 1)];
  A(n + 1, n + 1) = 0;
  
  % construct B, 
  % get the distance to POI
  d_poi = pdist([[x; x_in] [y; y_in]]);
  d_poi = d_poi(1:n);
  B = [variogram(d_poi, range,sill,nugget) 1];
  
% solve the linear equation system of A and right side of B
   w = A\B';

% the estimate is the dot product of the weights and the values
   z = w(1:n)' * z_in;       % or %  z = dot(w(1:n), z_in);
  
% Check for NaN (occurs with duplicate rows in input data)
  if isnan(z)
      disp('NaN value found')
  end
  
end
