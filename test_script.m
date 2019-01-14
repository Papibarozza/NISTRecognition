a = prnist([0:9],[1:100:1000]);
%%
preproc = im_box([],2,2)*im_resize([],[20 20])
a = a*preproc;
%%
[im_feat im_prof im_raw im_conv im_conv2] = get_feature_representation(a)
%%
c1 = im_feat*pcam(im_feat,12)*qdc;
c2 = im_prof*pcam(im_prof,12)*knnc([],6);
c3 = im_raw*pcam(im_raw,50)*qdc;
c4 = im_conv*pcam(im_conv,20)*parzenc(0.1);
combined_trained_classifier = [pcam(im_feat,12); pcam(im_prof,12); pcam(im_raw,50);pcam(im_conv,20)]*[c1*classc; c2*classc; c3*classc; c4*classc;]*prodc;
%%
E = nist_eval('dig2data',combined_trained_classifier,1)
