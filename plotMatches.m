% Code partially taken from vlfeat demo documentation

function matches = plotMatches(Ia, Ib, fa, fb, matches)
% concatenate images
figure(1) ; clf ;
combImg = imfuse(Ia, Ib, 'montage');
imshow(combImg);
borderSize = 17;

% get match locations
xa = fa(1,matches(1,:));
xb = fb(1,matches(2,:)) + size(Ia,2) + borderSize;
ya = fa(2,matches(1,:));
yb = fb(2,matches(2,:));
hold on;
% drawlines between matching keypoints
h = line([xa ; xb], [ya ; yb]) ;
set(h,'linewidth', 1, 'color', 'b') ;

% plot matches and lines
vl_plotframe(fa(:,matches(1,:))) ;
fb(1,:) = fb(1,:) + size(Ia,2) + borderSize ;
vl_plotframe(fb(:,matches(2,:))) ;
axis image off ;

end