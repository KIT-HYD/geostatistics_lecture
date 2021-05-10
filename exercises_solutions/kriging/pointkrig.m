function vp = pointkrig(xi, yi, zi, variogramf, range, sill, nugget,min_p, max_p)
  % Error of kriging interpolation by leave-one-out crossvalidation
  % 
  %  Performs ordinary kriging for input points and returns the interpolation error.
  %  You need to fit a variogram beforehand and check its validity. 
  %  Then pass the three variogram parameters from your best fit as 
  % arguments to this function
  %
  %  Arguments
  %  ---------
  %  xi,yi       Coordinate arrays (1D)
  %  zi          Value array for all [xi, yi]
  %  variogramf  variogram model function (@spherical, @gaussian, @exponential)
  %  range       range parameter of the variogram model
  %  sill        sill parameter of the variogram model
  %  nugget      nugget parameter of the variogram model
  %  min_p       Minimum number of neighbors to use
  %  max_p       Maximum number of neighbors to use
  %
  %  Returns
  %  -------
  %  vp       [double], the interpolated value at each observation point
  %
  
  % check if input is of different length
  nval = length(xi);
  if ~(nval == length(yi) & nval == length(zi))
     error('xi, yi, zi have to be of same length!')
  end
  
%% apply the ordinary_krige function for each observation and compare with 
  % observation
  
   vp = zeros(nval, 1); 
    
   for jj=1:nval
      % current coordinates
      x = xi(jj);
      y = yi(jj);
      % Perform kriging while leaving the current point out
      idx = (1:nval ~= jj);             % true for all other points
      vp(jj) = ordinary_krige_with_minp(xi(idx), yi(idx), zi(idx), x, y, variogramf, range, sill, nugget,min_p, max_p);
      
    end
  end








