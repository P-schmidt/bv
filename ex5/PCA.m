%The function below applies PCA to reduce the dimensionality
%of the data set.
function reduced_dim = PCA(data)

%Transform the images to vectors.
count = 0;
vectors_matrix = [];
for image = data
    count = count + 1;
    pixels = data{count}.img;
    vector = pixels(:);
    
    %Vectors is a matrix of image vectors.
    vectors_matrix = [vectors_matrix vector];
end

%Calculate the mean of vectors
[X,Y] = size(vectors_matrix);
m = mean(vectors_matrix, 2);

%Subtract the mean from every column/vector in the vectors_matrix.
data = vectors_matrix - repmat(m,1,Y);

% Split train and test data
trainData = data(:, 1:300);
testData = data(:, 301:550);

%Calculate the SVD and the PCA basis and reduced dimensionality.
%We decided for 20 PCA components, since was the optimal value
%that we calculated using the elbow method. This is explained more
%in the pdf in the hand in.
[U,S,V] = svd(trainData);

PCA_basis = U(:, 1:20)';
reducedTrain = PCA_basis*trainData;


%Plot the first 9 PCA vectors as images.
PCA_vectors(U);

% eigenvalues(S);

% compare computation time for PCA and naive 
randIdx = randi([1, 300],1);
randIm = trainData(:,randIdx);
[naiveTime, ~, ~] = similarity(trainData, randIm, 0);
randIm = reducedTrain(:,randIdx);
[PCAtime, ~, ~] = similarity(reducedTrain, randIm, 0);
ratio = naiveTime/PCAtime;


reducedTest = PCA_basis*testData;
learn(reducedTrain, reducedTest);
end