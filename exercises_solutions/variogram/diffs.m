function v=diffs(x)
  % diffs Calculates the upper triangle of doff_matrix.m
  % 
  % For x of length N, an array of (N**2 - N) / 2 elements containing 
  % the row-wise ordered upper triangle of diff_matrix.m is 
  % returned.
  %
  %  Arguments
  %  ---------
  %  x  array of length N, 2 containing 1D observations
  %
  %  Returns
  %  -------
  %  d upper triangle of diff_matrix.m as 1D array 
  
  N = length(x);
  v = ones(1, (N^2 - N) / 2) * -1;
  
  count = 1;
  for i=1:N
    for j=1:N
      if i < j
        v(count) = abs(x(i) - x(j));
        count = count + 1;
      end
    end
  end
end