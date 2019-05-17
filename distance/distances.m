function d=distances(X)
  % distances Calculates the upper triangle of distance_matrix.m
  % 
  % For X of shape(N,2), an array of (N**2 - N) / 2 elements containing 
  % the row-wise ordered upper triangle of distance_matrix.m is 
  % returned
  %
  %  Arguments
  %  ---------
  %  X  matrix of shape (N, 2) containing two dimensional coordinates
  %
  %  Returns
  %  -------
  %  d upper triangle of distance_matrix.m as 1D array 
  
  % REPLACE FROM HERE
  d = pdist(X);
  % TO HERE
end
