a = prnist([0:9],[1:4:1000]);
preproc = im_box([],2,2)*im_resize([],[20 20])
a = a*preproc;
%%
[im_feat, im_prof, im_raw, im_conv, im_conv2] = get_feature_representation(a);
%%
[trn,tst] = gendat(im_raw,0.5);
hs = [0.01 0.05 0.1 0.25 0.5 1 1.5 2 3 4 5]
for i = 1:length(hs) % For each h...
    w = parzenm(prdataset(+trn),hs(i)); % estimate Parzen density on trn
    Ltrn(i) = sum(log(+(trn*w))); % calculate trn log-likelihood
    Ltst(i) = sum(log(+(tst*w)));
end;
plot(hs,Ltrn,'b-'); hold on; % Plot trn log-likelihood as function of h
plot(hs,Ltst,'r-');
legend("train","test")
