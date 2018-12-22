% Federal University of Rio Grande do Norte
% Title: Algorithm 5
% Author: Danilo Pena

function algorithm5(name, qtd)

if (~strcmp(name(end-3:end),'.jpg'))
    name = [name, '.jpg'];
end

for ii=1:qtd
if ii==1

I = imread(name);
[M N D] = size(I);
hsv_I = rgb2hsv(I);
hsi_I = rgb2hsi(I);
clear criterion_vetor
criterion_vetor(M,N,qtd) = 0;

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
else
h_mean = mean(h_I(criterion_vetor(:,:,ii)==0)); %criterion
s_mean = mean(s_I(criterion_vetor(:,:,ii)==0));
v_mean = mean(v_I(criterion_vetor(:,:,ii)==0));
i_mean = mean(i_I(criterion_vetor(:,:,ii)==0));

h_std = std(h_I(criterion_vetor(:,:,ii)==0));
s_std = std(s_I(criterion_vetor(:,:,ii)==0));
v_std = std(v_I(criterion_vetor(:,:,ii)==0));
i_std = std(i_I(criterion_vetor(:,:,ii)==0));

v_mean_vetor = [v_mean_vetor v_mean];
end

if ii==1
    delta_E = 0;
    E = [];
    C = [];
    s_In = [];
    dp = 1.5;
    entropia_image = entropy(v_I(:));
end

const = (v_mean + 1.5*v_std);
const2 = (s_mean - s_std);

criterion1 = (v_I > const);
%criterion1 = (v_I > 0.85*max(max(v_I)));

%criterion2 = (s_I < const2);
criterion2 = (s_I < 0.25*max(max(s_I)));

%if (E < (entropy(v_I(:))*0.75))
if ii==1
    criterion = criterion1 .* criterion2;
    result1 = criterion;
    if numel(nonzeros(result1(:)))>0
        E = [E entropy(v_I(result1==1))];
    else
        E = [E entropy(v_I(:))];
        disp('No criterion reached');
        break;
    end
    
    s_In(:,:) = abs(s_I(:,:) - 1);
    C = [C corr2(v_I(result1==1),s_In(result1==1))];
else
    %criterion = criterion1 .* criterion_prev;
    result1 = criterion_vetor(:,:,ii-1);
    %criterion_prev = criterion_prev .* (~criterion);
    %result2 = ~criterion_prev;
    
    if numel(nonzeros(result1(:)))>0
        E = [E entropy(v_I(result1==1))];
        C = [C corr2(v_I(result1==1),s_In(result1==1))];
    else
        E = [E entropy(v_I(:))];
        C = [C corr2(v_I(:),s_In(:))];
        disp('No criterion reached');
        break;
    end
    
    %E1 = entropy(v_I(result1==1));
    %E2 = entropy(v_I(result2==1));
    delta_E = (E(ii) - E(ii-1));
end

if ii>1
    if C(ii) < 0
        text = ['Stop criterion reached, iteration ', num2str(ii), '.'];
        disp(text);
        break;
    end
    
    if (delta_E*3) > entropia_image
        dp = (delta_E / 10) + 1.5;
        const = (v_mean + dp*v_std);
        criterion1 = (v_I > const);
        text = ['Entropy correction, iteration ', num2str(ii), ' with std equal to ', num2str(dp), '.'];
        disp(text);
    end
    %criterion = criterion1 .* criterion_prev;
    criterion = criterion1;
    result1 = criterion;
    if numel(nonzeros(result1(:)))>0
        E(ii) = entropy(v_I(result1==1));
    end
    
    criterion = criterion + criterion_vetor(:,:,ii-1);
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

%end