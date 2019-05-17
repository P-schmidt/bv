%The function below applies PCA to reduce the dimensionality
%of the data set.
function reduced_dim = PCA(data)

%Split in training and test set.
training = data(1:300);
test = data(301:550);

%Transform the images to vectors.
count = 0;
vectors_matrix = [ ];
for image = training
    count = count + 1;
    pixels = training{count}.img;
    vector = pixels(:);
    
    %Vectors is a matrix of image vectors.
    vectors_matrix = [vectors_matrix vector];
end

%Calculate the mean of vectors
[X,Y] = size(vectors_matrix);
m = mean(vectors_matrix, 2);

%Subtract the mean from every column/vector in the vectors_matrix.
data = vectors_matrix - repmat(m,1,Y);

%Calculate the SVD and the PCA basis and reduced dimensionality.
%We decided for 20 PCA components, since was the optimal value
%that we calculated using the elbow method. This is explained more
%in the pdf in the hand in.
[U,S,V] = svd(data);
PCA_basis = U(1:20, :);
reduced_dim = PCA_basis*data;

%Plot the first 9 PCA vectors as images.
PCA_vectors(U)

end