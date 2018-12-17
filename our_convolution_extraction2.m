
function pixel_values = our_convolution_extraction2(img_data)
b = +img_data;
b = reshape(b, [20 20])
stride_width = 4;
stride_height = 4;

pixel_values = []
i=1;
j=1;
while( j+stride_height-2 < size(b,1))
    while (i+stride_width-2 < size(b,2))
            sub_mtrx = b(j:j+stride_height-1,i:i+stride_width-1);
            calc_mean = mean(reshape(sub_mtrx,[1 size(sub_mtrx,1)*size(sub_mtrx,1)]));
            pixel_values = [ pixel_values calc_mean];
            i= i+stride_width
    end
    j= j+stride_height
    i=1;
end