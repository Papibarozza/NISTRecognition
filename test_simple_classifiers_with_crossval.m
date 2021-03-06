a = prnist([0:9],[1:4:1000]);
%%
preproc = im_box([],2,2)*im_resize([],[20 20])
a = a*preproc;
%%
[im_feat, im_prof, im_raw, im_conv, im_conv2] = get_feature_representation(a);
%%
%Feature selection
%im_feat_red = select_features(im_feat,15);
%im_prof_red = select_features(im_feat,12)
%im_feat_red = im_feat
%im_prof_red = im_prof:
%%
o_classifier = ldc;
c1 = pcam([],12)*o_classifier;
c2 = pcam([],12)*o_classifier;
c3 = pcam([],50)*o_classifier;
c4 = pcam([],20)*o_classifier;
c5 = pcam([],5)*o_classifier;
%%
[Err_feat, Std1] = prcrossval(im_feat, c1, 10,2);
[Err_prof, Std2] = prcrossval(im_prof, c2, 10,2);
[Err_raw, Std3] = prcrossval(im_raw, c3, 10,2);
[Err_conv, Std4] = prcrossval(im_conv, c4, 10,2);
[Err_conv2, Std5] = prcrossval(im_conv2, c5, 10,2);
[Err_feat Err_prof Err_raw Err_conv Err_conv2]
[Std1 Std2 Std3 Std4 Std5]