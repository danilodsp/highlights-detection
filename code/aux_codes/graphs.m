% Federal University of Rio Grande do Norte
% Title: Graphs
% Author: Danilo Pena

s_In = abs(s_I(:,:) - 1);
vetor = v_I(125,291:308); %148,384:448,297,125:224,715,577:647,460,510:544
vetor_s = s_In(125,291:308);
%40,275:287,125,291:308
%subplot(1,2,2);
plot(1:numel(vetor),vetor,'-');
hold on
%subplot(1,2,2);imhist(vetor)
plot(1:numel(vetor),v_mean,'b');
plot(1:numel(vetor),(v_mean+1.5*v_std),'r');
plot(1:numel(vetor_s),(vetor_s),'-r');
ylim([0 1]);
%plot(1:numel(vetor_s),(distance2(125,291:308)),'m-');

%legend('canal v','mean','mean+1.5*std','canal s','mahalanobis');


% distance = mahal(v_I(:),s_I(:));
% 
% distance2 = [];
% for x=1:N
%     distancia2 = [distance2 distance(((x-1)*M + 1):(x*M))];
% end