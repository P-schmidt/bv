% Plots eigenvalues of first 50 principal components.

function eigenvalues(S)
sValues = diag(S);
pComps = sValues(1:50).^2;
x = linspace(1,50, 50)';

plot(x, pComps);
title('First 50 eigenvalues')
xlabel('nth component')
ylabel('Eigenvalue')
end