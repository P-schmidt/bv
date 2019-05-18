%The function below applies PCA to reduce the dimensionality
%of the data set.
function PCA(data)

%Transform the images to vectors.
count = 0;
vectors_matrix = [];
for image = data
    count = count + 1;
    pixels = data{count}.img;
    vector = pixels(:);
    
    %Vectors_matrix is a matrix of image vectors.
    vectors_matrix = [vectors_matrix vector];
end

%Calculate the mean of vectors
[X,Y] = size(vectors_matrix);
m = mean(vectors_matrix, 2);

%Subtract the mean from every column/vector in the vectors_matrix.
mean_form = vectors_matrix - repmat(m,1,Y);

%Split train and test data and shuffle the data.
trainData = mean_form(:, 1:300);
testData = mean_form(:, 301:550);
trainData = trainData(:, randperm(size(trainData, 2)));
testData = testData(:, randperm(size(testData, 2)));

%Calculate the SVD and the PCA basis. We decided to use 20 PCA 
%components, since that was the optimal value that we 
%calculated using the elbow method in the eigenvalues function.
[U,S,V] = svd(trainData);

%Accuracy rond de 0.7 als we wel de rijen nemen??? Snap het even
%niet zo goed meer.
PCA_basis = U(1:20, :);
%PCA_basis = U(:, 1:20)';

%Calculate the reduced representation/dimensionality of the training images. 
reducedTrain = PCA_basis*trainData;

%Plot the first 9 PCA vectors as images.
%PCA_vectors(U);

%Plot the eigenvalues of the first 50 PCA components.
%eigenvalues(S);

%Compare computation time for PCA and naive 
randIdx = randi([1, 300],1);
randIm = trainData(:,randIdx);
[naiveTime, ~, ~] = similarity(trainData, randIm, 0);
randIm = reducedTrain(:,randIdx);
[PCAtime, ~, ~] = similarity(reducedTrain, randIm, 0);
ratio = naiveTime/PCAtime;

%Calculate the reduced representation/dimensionality of the test images. 
reducedTest = PCA_basis*testData;
learn(reducedTrain, reducedTest);
end