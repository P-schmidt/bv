function projected = projectKeypoints(fa, fb, matches)

% get coordinates for projection matrix
xa = fa(1,matches(1,3:6));
xb = fb(1,matches(2,3:6));
ya = fa(2,matches(1,3:6));
yb = fb(2,matches(2,3:6));
xy = [xa;ya]';
xaya = [xb;yb]';

projMat = createProjectionMatrixwk3(xy, xaya);

% perform projection and divide resulting vectors by lambda
faHomogeneous = [fa(1,matches(1,:));fa(2,matches(1,:)); ones(size(fa(1,matches(1,:))))];
projected = projMat*faHomogeneous;
projected = projected(1:2,:)./ projected(3,:)

% ground truth comparison
fbLocations = [fb(1,matches(2,:));fb(2,matches(2,:))]

end