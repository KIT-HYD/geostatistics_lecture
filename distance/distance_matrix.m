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
 
  % REPLACE FROM HERE
  M = squareform(pdist(X));
  % TO HERE 

end
