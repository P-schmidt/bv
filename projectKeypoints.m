function projected = projectKeypoints(fa, fb, matches)

xa = fa(1,matches(1,1:4));
xb = fb(1,matches(2,1:4));
ya = fa(2,matches(1,1:4));
yb = fb(2,matches(2,1:4));

xy = [xa;ya]';
xaya = [xb;yb]';
projMat = fitgeotrans(xy, xaya, 'projective');

faLocations = [fa(1,matches(1,:));fa(2,matches(1,:))]';

projected = transformPointsForward(projMat, faLocations);
end