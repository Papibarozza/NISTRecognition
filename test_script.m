a = prnist([0:9],[1:100:1000]);
%%
%Doing clear all and using im_box([],2,2)*im_resize([],[20 20]) gives 7%
%error?? using [nmc*classc ldc*classc qdc*classc]*fisherc
preproc = im_box([],2,2)*im_resize([],[20 20])
a = a*preproc;
%%
[trn, tst,]= gendat(a,0.9);
[trn_im_features, trn_im_profile, trn_im_raw] = get_feature_representation(trn);
[tst_im_features, tst_im_profile, tst_im_raw] = get_feature_representation(tst);
%%
[im_features_classifier, trn_mpd_im_features, u1] = get_pca_classifier(trn_im_features, loglc, 18);
[im_profile_classifier, trn_mpd_im_profile, u2] = get_pca_classifier(trn_im_profile, knnc([],4),18);
[im_raw_classifier, trn_mpd_im_raw, u3] = get_pca_classifier(trn_im_raw,[nmc*classc ldc*classc qdc*classc]*fisherc,18);

%%
%raw_classifier = trn_im_raw*m3*[nmc*classc ldc*classc qdc*classc]*fisherc*classc
combined_classifier = [im_features_classifier*classc; im_profile_classifier*classc; im_raw_classifier*classc]*prodc
combined_untrained_classifier = [u1*classc; u2*classc; u3*classc]*prodc
%%
E = [tst_im_features tst_im_profile tst_im_raw]*combined_classifier*testc
%%
E2 =  tst_im_features*im_features_classifier*testc
E3 = tst_im_profile*im_profile_classifier*testc
[E4,C] = tst_im_raw*im_raw_classifier*testc
%%
[Err,Cerr] = prcrossval(prdataset(trn),pcam([],12)*ldc,10);
%%
E = nist_eval('dig2data',im_raw_classifier,100)
