function [x1, y1, x2, y2] = thetarho2endpoints(theta, rho, rows, cols, vertical);
if vertical
    y1 = 0;
    x1 = (y1*cos(theta) + rho)/sin(theta);
    
    y2 = rows;
    x2 = (y2*cos(theta) + rho)/sin(theta);
else
    x1 = 0;
    y1 = (x1*sin(theta) - rho)/cos(theta);
    
    x2 = cols;
    y2 = (x2*sin(theta) - rho)/cos(theta);
    
line([x1 y1], [x2 y2]);
end     
end