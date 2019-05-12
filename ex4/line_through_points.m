%Function calculates the optimal line for the points given
%as argument.
function l = line_through_points(points)

%Calculate the mean.
centroid_x = mean(points(:,1));
centroid_y = mean(points(:,2));

%Calculate the Covariance and the direction.
C = cov(points);
u = eig(C);

%These are two points on the line.
c = [centroid_x; centroid_y; 1];
point1 = c;
point2 = c+u;

l = cross(point1, point2);

end