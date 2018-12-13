function [mapped_data] = do_featsel_and_pca(o_dataset,nr_features,nr_dims)
%-------------------------
%o_dataset:  has to be a prdataset
%nr_features:  the number of features to extract
%nr_dims: the number of dims to keep after pcam
%--------------------------
%
%This function performs backwards feature selection on the o_dataset, training on 95% of the dataset,
%selects the best nr_features
%and returns the PCA-mapped (of dimension nr_dims) dataset.
[tst, trn] = gendat(o_dataset,0.05);
[w,r] = featselb(trn,'eucl-m',nr_features);
o_mapping = pcam(trn*w,nr_dims);
mapped_data = trn*w*o_mapping;
