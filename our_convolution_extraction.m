
function pixel_values = our_convolution_extraction(img_data)
b = +img_data;
b = reshape(b, [20 20])
stride_width = 2;
stride_height = 2;

pixel_values = []
i=1;
j=1;
while( j < size(b,1) )
    while (i < size(b,2))
            pixel_values = [ pixel_values mean([b(j,i) b(j,i+1) b(j+1,i) b(j+1,i+1)])]
            i= i+stride_width;
    end
    j= j+stride_height;
    i=1;
end