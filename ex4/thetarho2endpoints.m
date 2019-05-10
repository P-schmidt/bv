function [x1, y1, x2, y2] = thetarho2endpoints(theta, rho, rows, cols)
% calculation for horizontal lines
x1 = 0;
y1 = (x1*sin(theta) - rho)/cos(theta);

x2 = cols;
y2 = (x2*sin(theta) - rho)/cos(theta);

% calculation for vertical lines
if abs(y2 -y1) > cols
    y1 = 0;
    x1 = (y1*cos(theta) + rho)/sin(theta);
    
    y2 = rows;
    x2 = (y2*cos(theta) + rho)/sin(theta);
end

     
line([x1 x2], [y1 y2], 'LineWidth', 2);  

end