function projected = projectKeypoints(fa, fb, matches)

xa = fa(1,matches(1,1:4));
xb = fb(1,matches(2,1:4));
ya = fa(2,matches(1,1:4));
yb = fb(2,matches(2,1:4));

xy = [xa;ya]';
xaya = [xb;yb]';
projMat = createProjectionMatrixE(xy, xaya);

fbLocations = [fb(1,matches(2,:));fb(2,matches(2,:))]

faHomogeneous = [fa(1,matches(1,:));fa(2,matches(1,:)); ones(size(fa(1,matches(1,:))))];

% projected = transformPointsForward(projMat, faLocations);
projected = projMat * faHomogeneous;
end