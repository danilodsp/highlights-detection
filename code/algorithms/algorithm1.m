% Federal University of Rio Grande do Norte
% Title: Algorithm 1
% Author: Danilo Pena
% Description: Method based on mean and variance (u + k*sigma)

function algorithm1(name, qtd)

if (~strcmp(name(end-3:end),'.jpg'))
    name = [name, '.jpg'];
end

for ii=1:qtd
    
if ii==1
I = imread(name);
[M N D] = size(I);
hsv_I = rgb2hsv(I);
hsi_I = rgb2hsi(I);

h_I = hsv_I(:,:,1);
s_I = hsv_I(:,:,2);
v_I = hsv_I(:,:,3);
i_I = hsi_I(:,:,3);

h_mean = mean(h_I(:));
s_mean = mean(s_I(:));
v_mean = mean(v_I(:));
i_mean = mean(i_I(:));

h_std = std(h_I(:));
s_std = std(s_I(:));
v_std = std(v_I(:));
i_std = std(i_I(:));

v_mean_vetor = [v_mean];
v_std_vetor = [v_std];
else
h_mean = mean(h_I(criterion_vetor(:,:,ii-1)==0));
s_mean = mean(s_I(criterion_vetor(:,:,ii-1)==0));
v_mean = mean(v_I(criterion_vetor(:,:,ii-1)==0));
i_mean = mean(i_I(criterion_vetor(:,:,ii-1)==0));

h_std = std(h_I(criterion_vetor(:,:,ii-1)==0));
s_std = std(s_I(criterion_vetor(:,:,ii-1)==0));
v_std = std(v_I(criterion_vetor(:,:,ii-1)==0));
i_std = std(i_I(criterion_vetor(:,:,ii-1)==0));

v_mean_vetor = [v_mean_vetor v_mean];
v_std_vetor = [v_std_vetor v_std];
end

const = (v_mean + 1.5*v_std);
const2 = (s_mean - s_std);

%if const > 0.95
%    const = 0.95;
%end

criterion1 = (v_I > const);
%if numero==1
%criterion1 = (v_I > 0.85*max(v_I(:)));
%else
%criterion1 = (v_I > 0.85*max(v_I(criterion_vetor(:,:,numero-1)==0)));
%end

criterion2 = (s_I < const2);
%criterion2 = (s_I < 0.25*max(max(s_I)));

if ii==1
    clear criterio_vetor;
    criterion_vetor(M,N,qtd) = 0;
    criterion = criterion1 .* criterion2;
else
    %criterion = criterion1 .* criterion_prev;
    criterion = criterion1;
end

result_rgb = I;

for i=1:M
    for j=1:N
        if criterion(i,j)
            result_rgb(i,j,1) = 255;
            result_rgb(i,j,2) = 0;
            result_rgb(i,j,3) = 0;
        end
    end
end

%imshow(result_rgb)
if ii==1
    name = [strrep(name,name(end-3:end),''), num2str(ii), '.jpg'];
    criterion_vetor(:,:,1) = criterion;
else
    name = [strrep(name,name(end-4:end),''), num2str(ii), '.jpg'];
    criterion_vetor(:,:,ii) = criterion;
end
imwrite(result_rgb,name);

end