function test_set = find_images_and_extract()
test_set = prdataset([],[]);
digit_name = 0;
while(digit_name<10)
filename = sprintf('../Digits/%d.png',digit_name);
img_objects = extract_digits_from_img(filename);
images = [];
labels = cell(1,size(img_objects,3));
for i = [1:size(img_objects,3)]
    images = [images; reshape(img_objects(:,:,i),[1,400])];
    labels(i) = {sprintf('digit_%d',digit_name)};
end
current_digit_dataset = prdataset(images,labels);

%If first run, no concatination is needed
if(size(test_set)==[0 0])
    test_set = current_digit_dataset;
else
    test_set= concat_prdataset(test_set,current_digit_dataset);
end
digit_name=digit_name+1;
end