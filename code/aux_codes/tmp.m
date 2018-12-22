% Federal University of Rio Grande do Norte
% Title: tmp
% Author: Danilo Pena

n = 0;
for i=1:M
    for j=1:N
        if criterion5(i,j)
            n = n+1;
            b_v(n) = v_I(i,j);
            b_s(n) = s_I(i,j);
        end
    end
end

bv_mean = mean(b_v(:));
bs_mean = mean(b_s(:));