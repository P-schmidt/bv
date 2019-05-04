% script to demonstrate image mosaic
% by handpicking 4 matching points
% in the order topleft - topright - bottomright - bottomleft
f1 = imread('nachtwacht1.jpg');
f2 = imread('nachtwacht2.jpg');
figure(1);
imshow(f1);
xy = [164.7941 219.6604  220.8797  167.2326;
      67.4305   64.9920  128.3930  128.3930]';
 
xaya = [26.8520   69.7960   85.4120   39.8653;
      66.2547   50.6387  102.6920  117.0067]';
  
% [xy, xaya] = pickmatchingpoints(f1, f2, 4, 1)
% 
% T = createProjectionMatrixE(xy, xaya)
% tform = projective2d(T)
T = maketform('projective',xy, xaya)
[x y] = tformfwd(T,[1 size(f1,2)], [1 size(f1,1)]);
% [x y] = transformPointsForward(tform, [1 size(f1,2)], [1 size(f1,1)]);
% [x y] = tformfwd(tform,[1 size(f1,2)], [1 size(f1,1)]);

xdata = [min(1,x(1)) max(size(f2,2),x(2))];
ydata = [min(1,y(1)) max(size(f2,1),y(2))];
f12 = imtransform(f1,T,'Xdata',xdata,'YData',ydata);
f22 = imtransform(f2, maketform('affine', [1 0 0; 0 1 0; 0 0 1]), 'Xdata',xdata,'YData',ydata);
subplot(1,1,1);
figure(2);
imshow(max(f12,f22));