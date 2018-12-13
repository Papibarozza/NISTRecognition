function [mapped_data, pca_mapping] = do_pca(a,nr_dims)
o_mapping = pcam(a,nr_dims);
mapped_data = a*o_mapping;
pca_mapping = o_mapping