function [X, Y, dist] = CalculateDistance(x, y)
    %
    % INPUT
    % x and y are both row-vectors with position data.
    % (x(i),y(i)) is the position of the base staion(i) 
    %
    % OUTPUT
    % X is a matrix with the x-coordinates for all locations
    % Y is a matrix with the y-coordinates for all locations
    % dist is a matix with the distance to the nearst base staion for
    % every location
    
    % Sets the grid
    [X, Y] = meshgrid([0:10:1000], [0:10:1000]);
    
    % Computes the distance to all points for every base station and stores
    % it in an 3D matix
    for i = 1:length(x)
        dist(:,:,i) = sqrt((x(i)-X).^2 + (y(i)-Y).^2);
    end
    
    % Looks at the distances to all base staions for every point and picks
    % the one that is the closest and stores it in the first layer of the
    % matix (:,:,1)
    for row = 1:length(X)
        for column = 1:length(X)
            dist(row,column,1) = min(dist(row,column,:));
        end
    end
    dist = dist(:,:,1);
    
    % Plots the distances to nearest base staion in a 3D graph and labels
    % the axis
    surf(X,Y,dist)
    shading interp
    xlabel('x-coordinate');
    ylabel('y-coordinate');
    zlabel('Distance to Base Station');
    
end