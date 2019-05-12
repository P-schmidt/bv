%The function returns the pixelvalue of a point in the image.
function color = pixelValue(image, x, y, method)
if inImage(size(image), x, y)
    switch(method)
        case 'nearest'
            color = nearest(image, x, y);
            return;
        case 'linear'
            color = bilinear(image, x, y);
    end
    
%If a point is located outside the image the color is set to black.
else
    color = 0;
end