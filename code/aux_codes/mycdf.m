% Federal University of Rio Grande do Norte
% Title: mycdf
% Author: Danilo Pena

x = 0:255;
his = imhist(v_I);

for n=1:256
    if n>1
        c_real(n) = c_real(n-1) + his(n)/(M*N);
    else
        c_real(1) = his(n)/(M*N);
    end
end

plot(x,c_real)
hold on

c = normcdf(x,v_mean*256,v_std*256);
plot(x,c,'-r')
ylim([0 1]);