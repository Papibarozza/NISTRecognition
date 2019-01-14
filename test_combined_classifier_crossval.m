a = prnist([0:9],[1:4:1000]);
%%
preproc = im_box([],2,2)*im_resize([],[20 20])
a = a*preproc;
%%
[im_feat, im_prof, im_raw, im_conv, im_conv2] = get_feature_representation(a);
%%
%Feature selection
%im_feat_red = select_features(im_feat,15)
%im_prof_red = select_features(im_feat,12)
%im_prof_red = im_prof

%%
c1 = pcam([],12)*qdc;
c2 = pcam([],12)*qdc;
c3 = pcam([],50)*qdc;
c4 = pcam([],20)*qdc;
c5 = pcam([],10)*qdc;
%%
combined_untrained_classifier = [c1*classc; c2*classc; c3*classc; c4*classc;]*prodc;
%%
[Err, Std] = prcrossval([im_feat im_prof im_raw im_conv], combined_untrained_classifier, 10,10)

