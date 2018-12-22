% Federal University of Rio Grande do Norte
% Title: Algorithm 7
% Author: Danilo Pena

function algorithm7(name)

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

name = [strrep(name,name(end-3:end),''), ' sat.jpg'];

imwrite(s_I,name);

end