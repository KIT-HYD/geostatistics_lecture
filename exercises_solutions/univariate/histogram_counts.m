function [counts, centers] = histogram_counts(x, bins)
  %  histogram_counts  Calculate histogram
  % 
  %  Arguments
  %  ---------
  %  x      1D array of sample input data
  %  bins   int64, number of equidstant bins
  %
  %  Returns
  %  -------
  %  counts    array of bins length, the count of samples per class
  %  centers   array of bins length containing the bin class centers.
  
  % SOLUTION START
  step = (max(x) - min(x)) / bins;             % bin width
  centers = [step/2:step:bins*step] + min(x);  % bin centers
  edges = [min(x):step:max(x)];                % bin edges
  counts = zeros(1, bins);                     % array for counts
  
  % check each element of x to be in a specific class
  % then save the sum of matches
  counts(1) =  sum( (x <= edges(2)) )               % first bin contains everything smaller or equal to second 'edge'
  for i=3:length(edges)
    counts(i -1) = sum( (x > edges(i -1)) .* (x <= edges(i)) );   % values at edge get sorted to the bin with lower i
  end
  % SOLUTION END
end