addpath('attachments')
nw1 = imread('nachtwacht1.jpg');
imshow(nw1)
% hold on
nw1 = single(rgb2gray(nw1));
nw2 = imread('nachtwacht2.jpg');
nw2 = single(rgb2gray(nw2));


[F1,D1] = vl_sift(nw1);
[F2,D2] = vl_sift(nw2);

[matches, scores] = vl_ubcmatch(D1, D2) ;


% overlay sift keypoints

% perm = randperm(size(F1,2)) ;
% h1 = vl_plotframe(F1(:,perm)) ;
% h2 = vl_plotframe(F1(:,perm)) ;
% set(h1,'color','k','linewidth',3) ;
% set(h2,'color','y','linewidth',2) ;
% hold off;