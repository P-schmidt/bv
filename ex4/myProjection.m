%The function outputs a rectangular image projection.
function  projection = myProjection(image , x1, y1, x2 , y2 ,x3, y3, x4, y4, m, n, method)
    projection = zeros(n, m);
    
    %xy are the corner points of the projection image.
    xy = [0 0 n n; 0 m m 0]';
    
    %uv specifies a quadrilateral in the original image. 
    uv = [x1 x2 x3 x4; y1 y2 y3 y4]';
    
    p = createProjectionMatrix(xy, uv);
    
    %Create a matrix with all the points.
    shape = size(projection);
    xa = 1:shape(2);
    ya = 1:shape(1);
    [Z,Y] = meshgrid(xa,ya);
    M = [Z(:), Y(:)];
    m = transpose(M);
    
    %Add a row of 1 to m. 
    col_size = size(m, 2);
    ones_row = ones(1, col_size);
    m = [m; ones_row];
    
    %Loop through all the columns of m and new.
    new = p*m;
    count = 0;
    for col = m
        xIndex = col(1);
        yIndex = col(2);
        count = count + 1;
        x = new(1, count);
        y = new(2, count); 
        
        %Insert the color in the image projection.
        projection(yIndex , xIndex) = pixelValue(image, x,y, method);
    end 
end