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
  %  arg       method argument: either radius (method=1) or n (method=2)
  %
  %  Returns
  %  -------
  %  v      [double, double], the interpolated values
  %
  
  % First, build the grid
  x_range = max(xi) - min(xi);
  y_range = max(yi) - min(yi);
  
  vgrid = ones(int8(y_range / gridsize), int8(x_range / gridsize)) * NaN;
  
  % get the size
  [rows cols] = size(vgrid)
  
  % get the steps
  stepx = x_range / cols;
  stepy = y_range / rows;
  minx = min(xi);
  miny = min(yi);
  
  if method == 1
    for i=1:rows
      for j=1:cols
        % YOUR SOULTION FROM HERE
        % vgrid(i,j) = 
        % TO HERE
      end
    end
  elseif method == 2
    for i=1:rows
      for j=1:cols
        % YOUR SOLUTION FROM HERE
        % vgrid(i,j) = 
        % TO HERE
      end
    end
   else
    error('method can only be 1 (fixed radius) or 2 (fixed neighbors)');
  end
  
end
