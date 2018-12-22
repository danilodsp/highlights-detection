% Federal University of Rio Grande do Norte
% Title: mahaldist
% Author: Danilo Pena
% Description: Calculate Mahalanobis Distance between 2 matrix with equal
% dimensions
%
% dependence: covariance.m

function D = mahaldist(X, Y)

[m, n] = size(X);
C = covariance(X,Y);
mediaX = mean(X(:));
mediaY = mean(Y(:));

for i=1:m
    for j=1:n
        D(i,j) = sqrt(abs(X(i,j)-Y(i,j))' * (1/C(i,j)) * abs(X(i,j)-Y(i,j)));
    end
end


end