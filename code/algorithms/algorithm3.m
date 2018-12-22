% Federal University of Rio Grande do Norte
% Title: Algorithm 3
% Author: Danilo Pena

function algorithm3(name)

if (~strcmp(name(end-3:end),'.jpg'))
    name = [name, '.jpg'];
end

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

const = (v_mean + 1.5*v_std);
const2 = (s_mean - s_std);
if const2 < 0
    const2 = s_mean;
end
if const > 1
    const = v_mean;
end

criterion1 = (v_I > const);
%criterion1 = (v_I > 0.85*max(max(v_I)));

criterion2 = (s_I < const2);
%criterion2 = (s_I < 0.25*max(max(s_I)));

%criterion = criterio1 .* criterio2;
criterion = criterion1 .* criterion2;

i_new_mean = mean(i_I(criterion==1));
v_new_mean = mean(v_I(criterion==1));
v_new_std = std(v_I(criterion==1));
distance = (v_I - v_new_mean);
criterion4 = (distance) > 0; % 0.6

result_rgb = I;
for i=1:M
    for j=1:N
        if criterion4(i,j)
            result_rgb(i,j,1) = 255;
            result_rgb(i,j,2) = 0;
            result_rgb(i,j,3) = 0;
        end
    end
end

name = [strrep(name,name(end-3:end),''), '1.jpg'];
%imshow(result_rgb)
imwrite(result_rgb,name)