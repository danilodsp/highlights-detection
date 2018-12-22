% Federal University of Rio Grande do Norte
% Title: Covariance
% Author: Danilo Pena
% Description: Calculate covariance

function C = covariance(X, Y)

[m, n] = size(X);
mediaX = mean(X(:));
mediaY = mean(Y(:));

for i=1:m
    for j=1:n
        C(i,j) = (abs(X(i,j)-mediaX) * abs(Y(i,j)-mediaY));
    end
end

end