% Federal University of Rio Grande do Norte
% Title: Algorithm 6
% Author: Danilo Pena

if (~strcmp(name(end-3:end),'.jpg'))
    name = [name, '.jpg'];
end

I = imread(name);
[M N D] = size(I);
hsv_I = rgb2hsv(I);
hsi_I = rgb2hsi(I);

h_I = hsv_I(:,:,1);
h_mean = mean(h_I(:));
h_std = std(h_I(:));

sizeM = 3;

for i=1:M
    for j=1:N
        soma = 0;
        for x=(-(sizeM-1)/2):((sizeM-1)/2)
            for y=(-(sizeM-1)/2):((sizeM-1)/2)
                if ((i+x)>=1)&&(i+x<M)&&((j+y)>=1)&&(j+y<N)
                    soma = soma + (((h_I(i+x,j+y)-h_mean)/h_std)^3);
                end
            end
        end
        I_new(i,j) = soma/(sizeM*sizeM);
    end
end

I_new2(:,:) = (I_new(:,:) - min(I_new(:))) ./ (max(I_new(:)) - min(I_new(:)));