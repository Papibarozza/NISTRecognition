
%Gets the test set
test_set = find_images_and_extract()
%%
a = prnist([0:9],[1:100:1000]);
combined_classifier = get_trained_classifier(a)
%%
our_im_features = im_features(test_set,test_set,'all');
our_im_profiles =im_profile(setfeatsize(test_set,[1 getfeatsize(test_set)]));
our_im_raw = test_set;
our_im_conv = our_im_convolutions(test_set);
%%

err = [our_im_features our_im_profiles our_im_raw our_im_conv]*combined_classifier*testc
