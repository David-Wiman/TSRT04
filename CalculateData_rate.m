function data_rate = CalculateData_rate(X, Y, sig_noise, B)
    %
    % INPUT
    % X is a matrix with the x-coordinates for all locations
    % Y is a matrix with the y-coordinates for all locations
    % sig_noise is a matrix of the signal to noise ratio in all locations
    % B is the bandwidth
    %
    % OUTPUT
    % data_rate is a matrix of the data rate in all points
    
    % Presets variables
    n = length(sig_noise);
    data_rate = zeros(n);
    
    % Computes the data rate for different locations according to a given
    % formula
    for row = 1:n
        for column = 1:n
            if sig_noise(row, column) < 0.3
                data_rate(row, column) = 0;
            elseif sig_noise(row, column) > 63
                data_rate(row, column) = B*log2(1 + 63)/10^6;
            else
                data_rate(row, column) = B*log2(1 + sig_noise(row, column))/10^6;
            end
        end
    end
    
    % Plots the data rates in a 3D graph and labels the axis
    subplot(2,1,1)
    surf(X,Y,data_rate)
    shading interp
    xlabel('x-coordinate');
    ylabel('y-coordinate');
    zlabel('Data Rate, Mbit/s');
    
end
    