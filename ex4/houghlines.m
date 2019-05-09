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

rhomax = sqrt(imRows^2 + imCols^2);
drho = 2*rhomax /(nrhos -1);                                               
dtheta = pi/nthetas;                    

Hcopy = h;
Hcopy(Hcopy<thresh) = 0;
[bwl, nregions] = bwlabel(Hcopy);


for n = 1:nregions
    mask = bwl == n;      % Form a mask  for  each  region.
    region = mask .* h;   % Point -wise  multiply  mask by Hough  Transform
                          % to give  you an  image  with  just  one  region  of
                          % the  Hough  Transform
    [~, Idx] = max(h(:));
    [rhoIdx, thetaIdx] = ind2sub(size(m),Idx); % get coordinates for maximum

    rho = drho(nrho/2 - rhoIdx); % convert to rho/theta values
    theta = dtheta(1- thetaIdx);
    [x1, y1, x2, y2] = thetarho2endpoints(theta, rho, rows, cols, FALSE);
    
end
end