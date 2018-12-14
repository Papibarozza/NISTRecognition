a = prnist([0:9],[1:5:1000]);
%%
preproc = im_box([],2,2)*im_resize([],[20 20])
a = a*preproc;
%%
[im_feat, im_prof, im_raw] = get_feature_representation(a);
%%
%Feature selection
im_feat_red = select_features(im_feat,15)
im_prof_red = select_features(im_feat,12)

%%
[pca_mapped_im_feat, pca_map_im_feat] = do_pca(im_feat_red,6)
[pca_mapped_im_prof, pca_map_im_prof] = do_pca(im_prof_red,6)
[pca_mapped_im_raw, pca_map_im_raw] = do_pca(im_raw,18)

%%
o_classifier = ldc
[Err_feat, Cerr_feat] = prcrossval(pca_mapped_im_feat, o_classifier, 10);
[Err_prof, Cerr_prof] = prcrossval(pca_mapped_im_prof, o_classifier, 10);
[Err_raw, Cerr_prof] = prcrossval(pca_mapped_im_raw, o_classifier, 10);
[Err_feat Err_prof Err_raw]
