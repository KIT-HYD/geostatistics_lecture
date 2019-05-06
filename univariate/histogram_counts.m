function [count, edges] = histogram_counts(x, bins)
  %  histogram_counts  Calculate histogram
  % 
  %  Arguments
  %  ---------
  %  x      1D array of sample input data
  %  bins   int8, number of equidstant bins
  %
  %  Returns
  %  -------
  %  count  array of bins length, the count of samples per class
  %  edges  array of bins length + 1, the lower bound and all upper bounds of
  %         all bin classes
  
  [count, edges] = hist(x, bins); % REPLACE THIS LINE
end