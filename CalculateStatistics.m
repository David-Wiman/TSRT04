function [avg, no_cov] = CalculateStatistics(data_rate)
    %
    % INPUT
    % data_rate is a matrix with the data rates for all locations
    %
    % OUTPUT
    % avg is the average data rate in the area
    % no_cov is the number of locations with zero data rate
    
    % Presets variables
    n = length(data_rate);
    no_cov = 0;
    
    % Creates a histogram of the data rates with six uniform bins and labels
    % the axis
    subplot(2,1,2)
    histogram(data_rate,6);
    xlabel('Data rates')
    ylabel('Number of locations')
    
    % Computes the average of all elements in data_rate
    avg = mean(data_rate, 'all');
    
    % Computes the number of elements in data_rate that are strictly zero
    for row = 1:n
        for column = 1:n
            if data_rate(row,column) == 0
                no_cov = no_cov + 1;
            end
        end
    end
    
end
        
    