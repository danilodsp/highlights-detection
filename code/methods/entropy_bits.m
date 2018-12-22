% Federal University of Rio Grande do Norte
% Title: Entropy
% Author: Danilo Pena
% Description: Calculate entropy in bits

function y = entropy_bits(x)

[N M] = size(x);

y = zeros(1,M);

for ii = 1:M
    characters = unique(x(:,ii));
    freq = zeros(size(characters));
	
    for jj = 1:length(characters)
        freq(jj) = sum(x(:,ii) == characters(jj));
    end
	
    P = freq / sum(freq);
    y(ii) = -sum(P .* log2(P));
end
