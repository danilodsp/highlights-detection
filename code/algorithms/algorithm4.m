% Federal University of Rio Grande do Norte
% Title: Algorithm 4
% Author: Danilo Pena

%function algoritmo4(name)

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

%s_I = histeq(s_I);

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
if (v_mean + 1.5*v_std) > 1
    const = 0.85*max(v_I(:));
end
if (s_mean - s_std) < 0
    const2 = 0.25*max(s_I(:));
end

criterion1 = (v_I > const);
criterion2 = (s_I < const2);

criterion = criterion1 .* criterion2;

% Correction of saturation channel
% for i=1:M
%     for j=1:N
%         if ((s_I(i,j)==0)&&(v_I(i,j)<0.5))
%             s_I(i,j)=1;
%         end
%     end
% end

s_In = abs(s_I - 1);
distance = mahal(v_I(:),s_In(:));
%distance_2 = mahal(v_I(:),s_In(:));

distance2 = [];
%distance2_2 = [];
for x=1:N
    distance2 = [distance2 distance(((x-1)*M + 1):(x*M))];
    %distance2_2 = [distance2_2 distance_2(((x-1)*M + 1):(x*M))];
end
distance3 = (distance2 - min(distance2(:))) ./ (max(distance2(:)) - min(distance2(:)));
%distance3_2 = (distance2_2 - min(distance2_2(:))) ./ (max(distance2_2(:)) - min(distance2_2(:)));
criterion4 = distance3 > 0.75;
%criterion4_2 = distancia3_2 > 0.75;
%criterion4 = abs(distancia2) > 0;
%criterion5 = (criterion4 .* criterion) + (criterion4_2 .* criterion);
criterion5 = (criterion4 .* criterion);

result_rgb = I;
for i=1:M
    for j=1:N
        if criterion5(i,j)
            result_rgb(i,j,1) = 255;
            result_rgb(i,j,2) = 0;
            result_rgb(i,j,3) = 0;
        end
    end
end

name = [strrep(name,name(end-3:end),''), '1.jpg'];
%imshow(result_rgb)
imwrite(result_rgb,name)