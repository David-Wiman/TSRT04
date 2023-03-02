function sig_noise = CalculateSig_noise(X, Y, dist, P, sigmsq, K)
    %
    % INPUT
    % X is a matrix with the x-coordinates for all locations
    % Y is a matrix with the y-coordinates for all locations
    % dist is a matix with the distance to the nearst base staion for
    % every location
    % P is the power of the signal at the basestaion
    % sigmsq is the noisepower
    % K is a environmental constant beween 2 and 6
    %
    % OUTPUT
    % sig_noise is a matrix of the signal to noise ratio in all locations
    
    % Computes the signal-to-noise ratio according to a given formula
    sig_noise = P./(((1+dist).^K).*sigmsq);
    
    % Plots the signal-to-noise ratio in a 3D graph and labels the axis
    surf(X,Y,sig_noise)
    shading interp
    xlabel('x-coordinate');
    ylabel('y-coordinate');
    zlabel('Signal-to-Noise Ratio');
    zlim([0 1000]);
    
end