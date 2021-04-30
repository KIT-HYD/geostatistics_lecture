% Task 6
% Create a figure of a Matheron semi-variogram and a Cressie-Hawkins semi-variogram 
% next to each other for both data sets. Describe the differences. How do they change 
% if you change the binning? 

% parameters: number of bins (for data set1 - so we can have different n_bins per data set)
n_bins1 = 3;


%% DATA 'prec_gauge from other scripts
 % % from task_2
 task_2             % execute to run that script, if needed
                    % -> values diffs, distances and maximum distance

    % edges of bins (one more than bins)
    edges1 = linspace(0, maxd1, n_bins1 + 1);

% % calculate Matheron and Cressie estimators for first data set
    gamma_m1 = ones(1, n_bins1) * NaN;
    gamma_c1 = ones(1, n_bins1) * NaN;

    for i=2:length(edges1)
      samp = v1((d1 > edges1(i - 1)) & (d1 <= edges1(i)));
      if length(samp) > 1
        gamma_m1(i -1) = matheron(samp);
        gamma_c1(i -1) = cressie(samp);
      end
    end


%% DATA 'artificial' 
 % % from task_3
 
 task_3            % execute to run that script, if needed
                    % -> values diffs, distances and maximum distance

 n_bins2 = 12;
 
    % edges of bins (one more than bins)
    edges2 = linspace(0, maxd2, n_bins2 + 1);

% % calculate Matheron and Cressie estimators for second data set
    gamma_m2 = ones(1, n_bins2) * NaN;
    gamma_c2 = ones(1, n_bins2) * NaN;

    for i=2:length(edges2)
      samp = v2((d2 > edges2(i - 1)) & (d2 <= edges2(i)));
      if length(samp) > 1
        gamma_m2(i -1) = matheron(samp);
        gamma_c2(i -1) = cressie(samp);
      end
    end 
    
%%  plot
    % figure;
    % first data set
    subplot(2, 2, 1);
    plot(edges1(2:n_bins1 + 1), gamma_m1, 'o-r');
    title(sprintf('Matheron (PREC GAUGE), %d bins',n_bins1));
    xlabel('lag'); ylabel('semi-variance');

    subplot(2, 2, 3);
    plot(edges1(2:n_bins1 + 1), gamma_c1, 'o-r');
    title(sprintf('Cressie-Hawkins (PREC GAUGE), %d bins',n_bins1));
    xlabel('lag'); ylabel('semi-variance');   

    % second data set
    subplot(2, 2, 2);
    plot(edges2(2:n_bins2 + 1), gamma_m2, 'o-r');
    title(sprintf('Matheron (artificial), %d bins',n_bins2));
    xlabel('lag'); ylabel('semi-variance');

    subplot(2, 2, 4);
    plot(edges2(2:n_bins2 + 1), gamma_c2, 'o-r');
    title(sprintf('Cressie-Hawkins (artificial), %d bins',n_bins2));
    xlabel('lag'); ylabel('semi-variance');    
    
    
                    
                    
                    
                    
