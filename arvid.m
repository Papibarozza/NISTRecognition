a = prnist([0:9],[1:5:1000]);
%%
%Doing clear all and using im_box([],2,2)*im_resize([],[20 20]) gives 7%
%error?? using [nmc*classc ldc*classc qdc*classc]*fisherc
preproc = im_box([],2,2)*im_resize([],[20 20])
a = a*preproc;
%%
%BEST PERFORMANCE WITH [16 16] and [PCMA(raw) sillhouette_features]  only (10%)
[our_im_features, our_im_profiles, our_im_raw] = get_feature_representation(a)
%%
%tst = do_featsel_and_pca(our_im_features,25,18)
tst = do_pca(our_im_profiles,18)
%v = [parzenc(0.5)]
%v = [nmc*classc ldc*classc qdc*classc]*fisherc
v= knnc([],5)
[Err, Cerr] = prcrossval(tst,v,10);
