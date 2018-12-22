% Federal University of Rio Grande do Norte
% Title: Kullback
% Author: Danilo Pena
% Description: Kullback-Leibler divergence between discrete pdfs

function [y] = kullback(a, b, n)

num = 1/log(n);
za = find(a>0);
zb = find(b>0);

y = num*(a(za)'*log(a(za)) - a(zb)'*log(b(zb)));

end