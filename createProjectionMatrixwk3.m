%The function below creates the projection matrix.
function  projMatrix = createProjectionMatrixwk3(xy, uv)

    %This code was given in the assignment and it creates a matrix A.
    x = xy(:, 1);
    y = xy(:, 2);
    u = uv(:, 1);
    v = uv(:, 2);
    o = ones(size(x));
    z = zeros(size(x));
    Aoddrows = [x, y, o , z, z, z, -u.*x, -u.*y, -u];
    Aevenrows = [z, z, z, x, y, o, -v.*x, -v.*y, -v];
    A = [Aoddrows; Aevenrows ];
    
    %Reshape m in the projection matrix.
    m = null(A);
    projection = (m/m(9));
    projMatrix = reshape(projection, [3 3])';
end
