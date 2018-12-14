function [new_feature_space] = select_best_features(a,features_needed)
[feature_mapping,r] = featself(a,'eucl-m',features_needed)
new_feature_space = a*feature_mapping