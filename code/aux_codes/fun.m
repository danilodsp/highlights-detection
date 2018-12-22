% Federal University of Rio Grande do Norte
% Title: Fun
% Author: Danilo Pena

%function f = fun(x)
%f = (exp(-3/x) * (2*x^3 + 6*x^2 + 9*x + 9)) - 1.8*x^3;
%end

for i=1:M
    for j=1:N
        dist1 = abs(I(i,j,1) - I(i,j,2));
        dist2 = abs(I(i,j,2) - I(i,j,3));
        dist3 = abs(I(i,j,1) - I(i,j,3));
        %dist(i,j) = max(max(dist1,dist2),dist3);
        dist(i,j) = (255 - min(min(I(i,j,1),I(i,j,2)),I(i,j,3)))/255;
    end
end

%distn = (dist - min(dist(:))) ./ (max(dist(:)) - min(dist(:)));