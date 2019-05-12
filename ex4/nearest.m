%The function implements a nearest neighbor implementation.
function color = nearest(image, x, y)
    x = floor(x + 1/2);
    y = floor(y + 1/2);
    color = image(x, y);
end