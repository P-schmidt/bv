function [lines] = houghlines(im, h, thresh)
% HOUGHLINES
%
% Function  takes an  image  and its  Hough  transform , finds  the
% significant  lines  and  draws  them  over  the  image
%
% Usage:   houghlines(im , h, thresh)
%
% arguments:
%           im      - The  original  image
%           h       - Its  Hough  Transform
%           thresh  - The  threshold  level to use in the  Hough  Transform
%                      to  decide  whether  an edge is  significant
[imRows, imCols] = size(im);
[nrhos, nthetas] = size(h);

% recalc rhomax,drho,dtheta
rhomax = sqrt(imRows^2 + imCols^2);
drho = 2*rhomax /(nrhos -1);                                      
dtheta = pi/nthetas;                    

threshValue = thresh*max(h(:));

% create regions
Hcopy = h;
Hcopy(Hcopy<threshValue) = 0;
[bwl, nregions] = bwlabel(Hcopy);

lines = zeros(nregions, 3);

for n = 1:nregions
    mask = bwl == n;      % Form a mask  for  each  region.
    region = mask .* h;   % Point -wise  multiply  mask by Hough  Transform
                          % to give  you an  image  with  just  one  region  of
                          % the  Hough  Transform
    [~, Idx] = max(region(:));
    [rhoIdx, thetaIdx] = ind2sub(size(h),Idx); % get coordinates for maximum

    rho = drho*(-nrhos/2 + rhoIdx); % convert to rho/theta values
    theta = dtheta*(thetaIdx-1);
    [x1, y1, x2, y2] = thetarho2endpoints(theta, rho, imRows, imCols);
    lines(n,:) = [x2-x1 y2-y1 1];
    
    
hold off

end
end