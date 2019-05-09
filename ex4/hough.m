function h = hough(im, Thresh , nrho , ntheta)
% HOUGH
%
% Function  takes a grey  scale  image , constructs  an edge  map by  applying
% the  Canny  detector , and  then  constructs a Hough  transform  for  finding
% lines in the  image.
%
% Usage:   h = hough(im , Thresh , nrho , ntheta)
%
% arguments:
%               im      - The  grey  scale  image to be  transformed
%               Thresh  - A 2d-vector  giving  the  upper  and  lower
%                         hysteresis  threshold  values  for  edge()
%               nrho    - Number  of  quantised  levels  of rho to use
%               ntheta  - Number  of  quantised  levels  of  theta to use
%
% returns;
%               h       - The  Hough  transform
% ...
[width, height] = size(im);
rhomax = sqrt(width^2 + height^2);        % The  maximum  possible  value  of rho.
drho = 2*rhomax /(nrho -1);             % The  increment  in rho  between  successive                                        
                                        % entries  in the  accumulator  matrix.
                                        % Remember  we go  between +-rhomax.

dtheta = pi/ntheta;                     % The  increment  in theta  between  entries.
thetas = [0: dtheta :(pi-dtheta )];     % Array  of theta  values  across  the
                                        % accumulator  matrix.
  
accum = zeros(nrho, ntheta);
                                       
edgeIm = edge(im, 'canny', Thresh);
                                       
[Yidx, Xidx] = find(edgeIm);

for yx = [Yidx';Xidx']
    for theta=thetas
          rho = yx(2)*sin(theta) - yx(1)*cos(theta);
       
          % To  convert a value of rho or  theta
          % to its  appropriate  index in the  array  use:
          rhoIndex = round(rho/drho + nrho/2);
          thetaIndex = round(theta/dtheta + 1);
          % increment accum index
          accum(rhoIndex, thetaIndex) = accum(rhoIndex, thetaIndex) + 1;
    end
end

h = accum;


end



