function [our_im_features, our_im_profiles, our_im_raw] = get_feature_representation(a)
our_im_features = im_features(a,a,'all');
our_im_profiles = prdataset(im_profile(a),getlabels(a));
our_im_raw = prdataset(a,getlabels(a));