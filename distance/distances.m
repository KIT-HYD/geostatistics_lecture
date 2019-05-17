function d=distances(X)
  % distances Calculates the upper triangle of distance_matrix.m
  % 
  % For X of shape(N,2), an array of (N**2 - N) / 2 elements containing 
  % the row-wise ordered upper triangle of distance_matrix.m is 
  % returned.
  %
  %  Arguments
  %  ---------
  %  X  matrix of shape (N, 2) containing two dimensional coordinates
  %
  %  Returns
  %  -------
  %  d upper triangle of distance_matrix.m as 1D array 
  
  % SOLUTION START
  N = length(X);
  d = ones(1, (N^2 - N) / 2) * -1;
  
  count = 1;
  for i=1:N
    for j=1:N
      if i < j
        d(count) = sqrt( (X(i,1) - X(j, 1))^2 + (X(i, 2) - X(j, 2))^2 );
        count = count + 1;
      end
    end
  end
  % SOLUTION END
end
