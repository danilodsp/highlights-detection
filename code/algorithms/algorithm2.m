% Federal University of Rio Grande do Norte
% Title: Algorithm 2
% Author: Danilo Pena

vetor_v = reshape(v_I(criterion==1),numel(v_I(criterion==1)),1);
criterion3 = (abs(v_I - mean(vetor_v)) < std(vetor_v));
criterion3 = criterion3 .* ~criterion;

% no highlight
%vetor_v = reshape(v_I(criterion_prev==1),numel(v_I(criterion_prev==1)),1);
%v_mean = mean(vetor_v);
%v_std = std(vetor_v);

% with highlight
%vetor_v = reshape(v_I(criterio==1),numel(v_I(criterio==1)),1);
%v_mean = mean(vetor_v);
%v_std = std(vetor_v);

result_rgb = I;
for i=1:M
    for j=1:N
        if criterion3(i,j)
            result_rgb(i,j,1) = 0;
            result_rgb(i,j,2) = 255;
            result_rgb(i,j,3) = 0;
        end
    end
end

imshow(result_rgb)