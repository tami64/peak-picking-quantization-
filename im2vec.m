% Author and Developer: Dr. Taymaz Akan
% Color image quantization with peak-picking and color space
% https://doi.org/10.1007/s00530-020-00682-5
%  Journal of Multimedia Systems
% taymaz.farshi@gmail.com
% Istanbul 2020

function [img] = im2vec(I)
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
img(:,1) = R(:);
img(:,2) = G(:);
img(:,3) = B(:);

end

