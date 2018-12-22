H = 0;
Htmp = 0;
%b = [1 1 1 0 0];
%a = [1 0 1 1 0];
histv = imhist(v_I(criterio==0));
hists = imhist(v_I_anterior(criterio==0));
for x=1:256
    Htmp = 0;
    for y=1:256
        %for y=1:numel(a)
        pv = (histv(y)/numel(v_I(criterio==1)));
        ps = (hists(x)/numel(v_I_anterior(criterio==1)));
        %pvs = (histv(y)+hists(y))/(numel(a)+numel(a));
        %H = H + (p * log2(1/p));
        Htmp = Htmp + (((pv * ps)/pv) * log2(1/((pv * ps)/pv)));
    end
    ps = (hists(x)/numel(v_I_anterior(criterio==1)));
    H = H + (Htmp * ps);
end

%H = 0;
%a = [1 0 1 1 0];
%histv = imhist(v_I);
%for x=1:256
%    p = (histv(x)/numel(v_I));
%    H = H + (p * log2(1/p));
%end