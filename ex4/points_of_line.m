%Function calculates the distance from points to the houghline.
%If distance is smaller than epsilon, then that point is appended
%to the pts list, which gets returned at the end. 
function [pts] = points_of_line(points, line, epsilon)
pts = [ ];
for point = points.'
    distance = dot(line, point);
    if distance < epsilon
        point = point.';
        pts = [pts; point];
    end
end
end
    