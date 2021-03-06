function return_dataset = dig2data(a)
preproc = im_box([],2,2)*im_resize([],[20 20])
a = a*preproc;
[trn_im_features, trn_im_profile, trn_im_raw, trn_im_conv, trn_im_conv2] = get_feature_representation(a);
%return_dataset = [trn_im_features trn_im_profile trn_im_raw]
return_dataset = [trn_im_features trn_im_profile trn_im_raw trn_im_conv]