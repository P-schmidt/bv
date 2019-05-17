function signals = PCA(data)
training = data(1:300);
test = data(301:550);

count = 0;
vectors = [ ];
for image = training
    count = count + 1;
    pixels = training{count}.img;
    
    vector = pixels(:);
    vectors = [vectors vector];
end

[M,N] = size(vectors);
mn =  mean(vectors, 2);
data = vectors - repmat(mn,1,N);

[U,S,V] = svd(data);
comp = U(1:20, :);
size(comp)
size(data)
reduced_dim = comp*data;

test = U(:, 1:9);
for j = test
    im = reshape(j,112,150);
    imshow(im, [])
end

%Eigen mean code
% vec = vectors.';
% average_vector = mean(vec);
% average_vector = average_vector.';
% average = [ ];
% for col = vectors
%     image_vector = col - average_vector;
%     average = [average image_vector];
% end

%size(average)

end