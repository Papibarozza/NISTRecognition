function return_dataset = dig2data(a)
preproc = im_box([],2,2)*im_resize([],[20 20])
a = a*preproc;
%[trn_im_features, trn_im_profile, trn_im_raw] = get_feature_representation(a);
%return_dataset = [trn_im_features trn_im_profile trn_im_raw]
return_dataset = prdataset(a,getlabels(a))