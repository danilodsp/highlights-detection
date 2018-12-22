% Federal University of Rio Grande do Norte
% Title: newhsv
% Author: Danilo Pena

%function [h,s,v] = newhsv(I)

hsv_I = rgb2hsv(I);
h = hsv_I(:,:,1);
v = hsv_I(:,:,3);

Id = double(I);

v_tmp = v/255;
s = (v_tmp - min(min(Id(:,:,1),Id(:,:,2)),Id(:,:,3))) ./ v_tmp;

%end