addpath('attachments');
im = imread('shapes.png');
im = rgb2gray(im);
figure(1);
imshow(im);
hold on


h = hough(im, 0.8, 90, 90);
% figure; 
% h = imshow(h, []);
% axis on

lines = houghlines(im, h, 0.58)



