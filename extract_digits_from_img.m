%'../Digits/digits-black.bmp'
function img_objects = extract_digits_from_img(filename) 
A = imread(filename);
CC =bwconncomp(A);
B = zeros(size(A));
img_objects = [];
for i = [1:CC.NumObjects]
    pixel_idx = cell2mat(CC.PixelIdxList(i));
    B(pixel_idx) = 1;
    rect = regionprops(B,'BoundingBox');
    curr_img = im2bw(imresize(imcrop(B,rect.BoundingBox)*im_box([],10),[20 20]),0.5)
    img_objects = [img_objects curr_img];
    B = zeros(size(A));
end


