%Run 'test_5' in the command line to run the functions
%points_of_line, pnt, and line_through_points. One line is
%selected from the output of the houghlines.

%Read image
addpath('attachments');
im = imread('shapes.png');
im = rgb2gray(im);
figure(1);
imshow(im);
hold on

%Calculate the points.
pt = pnt(im);

%Calculate the houghline.
h = hough(im, 0.8, 90, 90); 
lines = houghlines(im, h, 0.58);
line = lines(1,:);

%Calculate the line for the points (pt).
pts = points_of_line(pt, line, 7000);
line_through_points(pts)
