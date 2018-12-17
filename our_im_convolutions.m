function our_dataset = our_im_convolutions(a)
    nmbr_obj  = size(a,1);
    feature_matrix = [];
    i=1;
    while(i<nmbr_obj+1)
        feature_matrix = [feature_matrix; our_convolution_extraction(+(a(i)))];
        i=i+1;
    end
    our_dataset = prdataset(feature_matrix, getlabels(a));