%Function plots the first 9 PCA vectors as images.
function PCA_vectors(U)
    count = 0;
    for im = U(:, 1:9)
        count = count + 1;
        image = reshape(im,112,150);
        subplot(3,3,count);
        imshow(image, [])
    end
end