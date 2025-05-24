% Author and Developer: Dr. Taymaz Rahkar Farshi
% Color image quantization with peak-picking and color space
% https://doi.org/10.1007/s00530-020-00682-5
%  Journal of Multimedia Systems
% taymaz.farshi@gmail.com
% Istanbul 2020
% www.taymaz.dev
function [R,H] = grayseg(Tresh_index)
global I;
size_result = length(Tresh_index);
img = I;

img(I<=Tresh_index(1))=0;
% if size_result==2
%     i=2;
%     img( (I>G_best_pos(1))) = i-1;
% else
    for i = 2:size_result
        img( (I>Tresh_index(i-1))&(I<=Tresh_index(i))) = Tresh_index(i-1);
        
    end
% end

img(I>Tresh_index(size_result))=255;

imshow(img);
end