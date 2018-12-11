a = prnist([0:9],[1:5:1000]);

%%
%BEST PERFORMANCE WITH [16 16] and [PCMA(raw) sillhouette_features]  only (10%)
preproc = im_box([],0,1)*im_gray*im_resize([],[16 16])*im_box([],2,0);
%preproc = im_box([],0,1)
a = a*preproc;
%%
all_features_im = im_features(a,a,'all');

%%
pcam_im_features_mapping = pcam(prdataset(all_features_im,[]),18);
%%
pcam = pcam(prdataset(a,[]));
feats = prdataset(a,[])*pcam;
%%
feat_im = prdataset(all_features_im)*pcam_im_features_mapping
feats_all = prdataset([+feats +feat_im],getlabels(a))
%%
feat_im_moments = im_moments(prdataset(a),'zer',10);
%%
feat_im_profile = im_profile(a);
%%
im_profile_mapping = pcam(feat_im_profile,18);
%%
feat_im_profile = feat_im_profile*im_profile_mapping;
%%
%v = knnc([],3)
%v = [nmc*classc ldc*classc qdc*classc]*fisherc
v2 = [parzenc([],0.5) knnc([],3)]*ldc
test = prdataset([+feats +prdataset(feat_im_profile)],getlabels(a))
[Err, Cerr] = prcrossval(test,v,10);
