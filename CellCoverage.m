function [avg, no_cov] = CellCoverage(x, y, P, sigmsq, K, B)
    %
    % INPUT
    % x is a row vector with the base stations' x coordinates
    % y is a row vector with the base stations' y coordinates
    % P is the power of the signal at the basestaion (~1)
    % sigmsq is the noisepower (~10^-11.2)
    % K is a constant beween 2 and 6 depending on the environment
    % B is the bandwidth (~10^7)
    %
    % OUTPUT
    % Plots a graph of the data rates in different locations
    % Plots a histogram of the data rates
    % avg is the average data rate in the area
    % no_cov is the percentage of locations without cell coverage
    
    % Checks if all expected positive values are positive
    if P<0 || sigmsq<0 || K<0 || B<0
        error('One or more negative numbers were noticed when positive ones were expected')
    end
    
    % Checks if the base staion indexing is matching
    if length(x) ~= length(y)
        error('Different number of base staion x-coordinates and y-coordinates')
    end

    % Runs the different functions
    [X,Y,dist] = CalculateDistance(x, y);
    sig_noise = CalculateSig_noise(X,Y,dist,P,sigmsq,K);
	data_rate = CalculateData_rate(X,Y,sig_noise,B);
    [avg, no_cov] = CalculateStatistics(data_rate);
    
    % Translates the number of people without coverage into a percentage
    no_cov = no_cov/(length(X)^2);
    
end