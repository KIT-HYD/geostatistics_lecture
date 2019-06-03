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
  
  % REPLACE FROM HERE
  [counts, centers] = hist(x, bins);
  % TO HERE
end