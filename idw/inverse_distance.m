function vgrid = inverse_distance(xi, yi, vi, gridsize, method, arg)
  % inverse_distance  Perform inverse distance weights interpolation
  % 
  %  Put your documentation here.
  %
  %  Arguments
  %  ---------
  %  xi,yi     Coordinate arrays (1D)
  %  vi        Value array for all [xi, yi]
  %  gridsize  spatial resolution of the regular grid
  %  method    Can be either 1 (fixed radius) or 2 (fixed neighbors)
  %  arg       method argument: either radius (mehtod=1) or n (method=2)
  %
  %  Returns
  %  -------
  %  v      [double, double], the interpolated values
  %
  
  % First, build the grid
  x_range = max(xi) - min(xi);
  y_range = max(yi) - min(yi);
  
  vgrid = ones(int8(y_range / gridsize), int8(x_range / gridsize)) * -9999;
  
  if method == 1
    % REPLACE FROM HERE
    % apply the correct function to all cells
    vgrid = ones(size(vgrid)) * mean(vi);
    % TO HERE
  elseif method == 2
    % REPLACE FROM HERE
    % apply the correct function to all cells
    vgrid = ones(size(vgrid)) * mean(vi);
    % TO HERE
   else
    error('method can only be 1 (fixed radius) or 2 (fixed neighbors)');
  end
  
end
