%This function calculates the corner points of objects in an image.
%These corner points are then used to straighten the object in the
%image. 
function straight = straighten()

%Read image
addpath('attachments');
im = imread('shapes.png');
im = rgb2gray(im);

%Calculate the points.
pt = pnt(im);

%Calculate the houghlines.
h = hough(im, 0.8, 90, 90); 
lines = houghlines(im, h, 0.58);

%Select four houghlines, depending on which ones surround the
%object and intersect.
line1 = lines(1,:);
line2 = lines(2,:);
line3 = lines(3,:);
line4 = lines(4,:);

%Calculate optimal line1 for the points (pt).
pts = points_of_line(pt, line1, 20000);
optimal_line1 = line_through_points(pts);
optimal_line1 = optimal_line1.';

%Calculate optimal line 2 for the points (pt).
pts = points_of_line(pt, line2, 15000);
optimal_line2 = line_through_points(pts);
optimal_line2 = optimal_line2.';

%Calculate optimal line3 for the points (pt).
pts = points_of_line(pt, line3, 15000);
optimal_line3 = line_through_points(pts);
optimal_line3 = optimal_line3.';

%Calculate optimal line4 for the points (pt).
pts = points_of_line(pt, line4, 10000);
optimal_line4 = line_through_points(pts);
optimal_line4 = optimal_line4.';

%So the intersection points are the corner points. 
intersection12 = intersection(optimal_line1, optimal_line2);
intersection23 = intersection(optimal_line2, optimal_line3);
intersection34 = intersection(optimal_line3, optimal_line4);
intersection41 = intersection(optimal_line4, optimal_line1);

%Normalize homogeneous coordinates.
x1 = intersection12(1)/intersection12(3);
y1 = intersection12(2)/intersection12(3);
x2 = intersection23(1)/intersection23(3);
y2 = intersection23(2)/intersection23(3);
x3 = intersection34(1)/intersection34(3);
y3 = intersection34(2)/intersection34(3);
x4 = intersection41(1)/intersection41(3);
y4 = intersection41(2)/intersection41(3);

%Use myprojection to straighten the image object.
straight = myProjection(im, x1, y1, x2, y2 ,x3, y3, x4, y4, 256, 256, 'nearest');
imshow(straight);
end
