addpath('attachments');
im = imread('shapes.png');
im = rgb2gray(im);
% figure(1);
% imshow(im);

% [accumulator, thetas, rhos] = hough(image, 0, 90, 90);

[h, thetas, rhos] = hough(im, 0.8, 90, 90);
figure(2);
imshow(h);

