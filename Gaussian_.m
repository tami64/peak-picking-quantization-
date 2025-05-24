% Author and Developer: Dr. Taymaz Akan
% Color image quantization with peak-picking and color space
% https://doi.org/10.1007/s00530-020-00682-5
%  Journal of Multimedia Systems
% taymaz.farshi@gmail.com
% Istanbul 2020

function [R] = Gaussian_(I,ch)
    [x,y,z] = size(I);
    if z==3
        I1 = I(:,:,ch);
    end
    H = imhist(I1);
    h = fspecial('gaussian', 3, 11);
    R = imfilter(H,h);
end