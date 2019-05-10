%Function calculates the line for the points returned by the
%function points_of_line.
function l = line_through_points(points)

%Calculate the mean.
centroid_x = mean(points(:,1));
centroid_y = mean(points(:,2));

points = points(:,1:end-1);

%Calculate the Covariance and the direction.
C = cov(points);
u = eig(C);
u = [u; 1];

c = [centroid_x; centroid_y; 1];
point1 = c;
point2 = c+u; 

l = cross(point1, point2)
end