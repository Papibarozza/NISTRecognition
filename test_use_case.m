img_objects = extract_digits_from_img('../Digits/unconnected.bmp')
%%
im_raw = prdataset(a,getlabels(a));
trained_classifier= im_raw*ldc

%%
current_img = reshape(img_objects(1:20, 1:20),[1,400]);
current_img = prdataset(current_img,['digit_1']);
%%
err = current_img*trained_classifier*classc

%%
%Demo
for i = [1: size(img_objects,2)/20-1]
    figure
    show(img_objects(1:20, (i*20):(i+1)*20))
end