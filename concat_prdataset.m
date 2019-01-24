%Function that combines two prdatasets..
function concat_dataset = concat_prdataset(dataset1,dataset2)
concat_dataset = prdataset([+dataset1; +dataset2],[getlabels(dataset1);getlabels(dataset2)]);