addpath('attachments')
% figure(2);
nw1 = imread('nachtwacht1.jpg');
% imshow(nw1);
nw1 = single(rgb2gray(nw1));
nw2 = imread('nachtwacht2.jpg');
nw2 = single(rgb2gray(nw2));
% hold on

[fa,da] = vl_sift(nw1);
[fb,db] = vl_sift(nw2);

[matches, scores] = vl_ubcmatch(da, db);

% plot keypoints
% perm = randperm(size(fa,2)) ;
% h1 = vl_plotframe(fa(:,perm)) ;
% h2 = vl_plotframe(fa(:,perm)) ;
% set(h1,'color','k','linewidth',3) ;
% set(h2,'color','y','linewidth',2) ;
% hold off;



% m = plotMatches(nw1, nw2, fa, fb, matches);
projected = projectKeypoints(fa, fb, matches)