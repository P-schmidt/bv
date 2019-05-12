%Function checks if a point is located within the image domain.
function a = inImage(imagesize, x, y)
    a = 1<=x & x<=imagesize(2) & 1<=y & y<=imagesize(1);
end