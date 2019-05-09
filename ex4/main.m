addpath('attachments');
im = imread('shapes.png');
im = rgb2gray(im);
figure(1);
imshow(im);

h = hough(im, 0.8, 180, 180);
figure; 
h1 = imshow(h, []);
axis on
impixelinfo(h1);

