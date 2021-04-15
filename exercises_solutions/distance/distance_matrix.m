function M=distance_matrix(X)
  % distance_matrix Calculates the distance matrix of X
  % 
  % Returns a lenght(X) by length(X) matrix of all pairwise 
  % Euclidean distance of X
  %
  %  Arguments
  %  ---------
  %  X  matrix of shape (N, 2) containing two dimensional coordinates
  %
  %  Returns
  %  -------
  %  M matrix of shape (N, N) of all pairwise distances
 
  % SOLUTION START
  N = length(X);
  M = ones(N, N) * -1;  
  
  for i=1:N
    for j=1:N
      M(i,j) = sqrt( (X(i,1) - X(j, 1))^2 + (X(i, 2) - X(j, 2))^2 );
    end
  end
  % SOLUTION END

end
