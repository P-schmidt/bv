%Function to calculate the edged image. This function returns
%the points argument for the points_of_line function.
function points = pnt(image)
    edgeIm = edge(image,'canny');
    [y,x] = find(edgeIm);
    pts = [ ];
    pts = [pts x];
    pts = [pts y];
    row_size = size(pts, 1);
    ones_col = ones(1, row_size);
    ones_col = ones_col.';
    points = [pts ones_col];
end