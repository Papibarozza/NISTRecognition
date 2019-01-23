a = prnist([0:9],[1:5:1000]);
%%
preproc = im_box([],2,2)*im_resize([],[20 20]);
a = a*preproc;
%%
[tst, trn] = gendat(prdataset(im_features(a)), 0.05);    
%%
rp = randperm(size(trn,2));
random_features = clevalf(trn(:,rp),ldc,[1:(size(trn,2))],[],1,tst(:,rp));

regular_features = clevalf(trn,ldc);

[w,r] = featselb(trn,'eucl-m')
selected_features_b = clevalf(trn*w,ldc);

[w,r] = featself(trn,'eucl-m')
selected_features_f = clevalf(trn*w,ldc);

[w,r] = featseli(trn,'eucl-m')
selected_features_i = clevalf(trn*w,ldc);
%%
plote({random_features,selected_features_b,selected_features_f,selected_features_i})
%%
[w,r]= featself(trn,'eucl-m',14)
%%
[E,CRR]= prcrossval(trn*w,knnc([],5),10)