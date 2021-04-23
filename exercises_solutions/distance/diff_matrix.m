function V=diff_matrix(x)
  % diff_matrix Calculates the pairwise differences of X
  % 
  % Returns a length(X) by length(X) matrix of all pairwise 
  % absolute differences of X
  %
  %  Arguments
  %  ---------
  %  X  array of shape length N containing observations
  %
  %  Returns
  %  -------
  %  M matrix of shape (N, N) of all pairwise absolute observation distances
 
  N = length(x);
  V = ones(N, N) * -1;  
  
  for i=1:N
    for j=1:N
      V(i,j) = abs(x(i) - x(j));
    end
  end

end