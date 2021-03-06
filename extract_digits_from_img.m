
function img_objects = extract_digits_from_img(filename)
A = imread(filename);
%If input is RGB we need to convert it, but it wont work if the input is
%not RGB hence the try-catch.
try
A = rgb2gray(A);
catch
    A=A
end

CC =bwconncomp(A);
B = zeros(size(A));
img_objects = [];
for i = [1:CC.NumObjects]
    pixel_idx = cell2mat(CC.PixelIdxList(i));
    B(pixel_idx) = 1;
    rect = regionprops(B,'BoundingBox');
    curr_img = im2bw(imcrop(A,rect.BoundingBox)*im_box([],2,2)*im_resize([],[20 20]));
    try
        img_objects = cat(3,img_objects,curr_img);
    end
    B = zeros(size(A));
end


