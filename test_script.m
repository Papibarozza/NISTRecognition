a = prnist([0:9],[1:100:1000]);
%%
%Doing clear all and using im_box([],2,2)*im_resize([],[20 20]) gives 7%
%error?? using [nmc*classc ldc*classc qdc*classc]*fisherc
preproc = im_box([],2,2)*im_resize([],[20 20])
a = a*preproc;
%%
[trn, tst]= gendat(a,0.1);
[trn_im_features, trn_im_profiles, trn_im_raw] = get_feature_representation(trn);
[tst_im_features, tst_im_profiles, tst_im_raw] = get_feature_representation(tst);

%trn_im_features_mapping 
m1 = pcam(trn_im_features,18);
%trn_im_profiles_mapping 
m2 = pcam(trn_im_profiles,18);
%trn_im_raw_mapping
m3 = pcam(trn_im_raw,18);

%%
im_features_classifier = m1*loglc*classc
im_profiles_classifier = m2*knnc([],5)*classc
raw_classifier = [m3*nmc*classc m3*ldc*classc m3*qdc*classc]*fisherc
combined_classifier = [im_features_classifier; im_profiles_classifier; raw_classifier]*prodc
%%
E = [tst_im_features tst_im_profiles tst_im_raw]*combined_classifier*testc([])
