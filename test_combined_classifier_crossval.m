a = prnist([0:9],[1:100:1000]);
%%
preproc = im_box([],2,2)*im_resize([],[20 20])
a = a*preproc;
%%
[im_feat, im_prof, im_raw] = get_feature_representation(a);
%%
%Feature selection
im_feat_red = select_features(im_feat,15)
%im_prof_red = select_features(im_feat,12)
im_prof_red = im_prof

%%
[pca_mapped_im_feat, pca_map_im_feat] = do_pca(im_feat_red,12)
[pca_mapped_im_prof, pca_map_im_prof] = do_pca(im_prof_red,12)
[pca_mapped_im_raw, pca_map_im_raw] = do_pca(im_raw,18)

%%
c1 = loglc
c2 = knnc([],5)
c3 = [nmc*classc ldc*classc qdc*classc]*fisherc;
combined_untrained_classifier = [c1*classc; c2*classc; c3*classc]*prodc

[Err, Cerr] = prcrossval([pca_mapped_im_feat pca_mapped_im_prof pca_mapped_im_raw], combined_untrained_classifier, 10);

