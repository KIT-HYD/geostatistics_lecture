function vgrid = kriging(xi, yi, zi, gridsize, variogramf, range, sill, nugget, max_p)
  % kriging  Perform kriging interpolation
  % 
  %  Main kriging routine. Performs ordinary kriging on a regular grid.
  %  You need to fit a variogram beforehand and check its validity. 
  %  Then pass the three variogram parameters from your best fit as 
  % arguments to this function
  %
  %  Arguments
  %  ---------
  %  xi,yi       Coordinate arrays (1D)
  %  zi          Value array for all [xi, yi]
  %  gridsize    spatial resolution of the regular grid
  %  variogramf  variogram model function (@spherical, @gaussian, @exponential)
  %  range       range parameter of the variogram model
  %  sill        sill parameter of the variogram model
  %  nugget      nugget parameter of the variogram model
  %  max_p       Maxmium number of neighbors to use
  %
  %  Returns
  %  -------
  %  vgrid       [double, double], the interpolated values
  %
  
  % First, build the grid
  x_range = max(xi) - min(xi);
  y_range = max(yi) - min(yi);
  
  % interpolation grid, filled with NaN
  vgrid = ones(int16(y_range / gridsize), int16(x_range / gridsize)) * NaN;
  
  % get the size
  [rows cols] = size(vgrid);
  
  % calculate the grid step size
  stepx = x_range / cols;
  stepy = y_range / rows;
  minx = min(xi);
  miny = min(yi);
  
  % apply the ordinary_krige function for each pixel in vgrid
  h = waitbar(0, '0.0%');
  for i=1:rows
    for j=1:cols
      % current coordinates
      x = (j - 1) * stepx + minx;
      y = (i -1) * stepy + miny;
      vgrid(i,j) = ordinary_krige(xi, yi, zi, x, y, variogramf, range, sill, nugget, max_p);
      waitbar(i / rows, h, sprintf('%.1f%%', i / rows * 100));
    end
  end
  close(h);
end