% functions as main file
% all functionality up until ransac procedure
% is performed in this file
addpath('attachments')

% get images in right format
nw1 = imread('nachtwacht1.jpg');
nw1 = single(rgb2gray(nw1));
nw2 = imread('nachtwacht2.jpg');
nw2 = single(rgb2gray(nw2));

% perform sift for feature detection
[fa,da] = vl_sift(nw1);
[fb,db] = vl_sift(nw2);

% get matches for the two images
[matches, scores] = vl_ubcmatch(da, db);

% plot matches
m = plotMatches(nw1, nw2, fa, fb, matches);

% returns matrix of projected coordinates
projected = projectKeypoints(fa, fb, matches);