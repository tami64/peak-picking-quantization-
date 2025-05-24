% Author and Developer: Dr. Taymaz Rahkar Farshi
% Color image quantization with peak-picking and color space
% https://doi.org/10.1007/s00530-020-00682-5
%  Journal of Multimedia Systems
% taymaz.farshi@gmail.com
% Istanbul 2020
% www.taymaz.dev
function [I] = Vec2im(vec_im,U,V)

I(:,:,1)=reshape(vec_im(:,1),U,V);
I(:,:,2)=reshape(vec_im(:,2),U,V);
I(:,:,3)=reshape(vec_im(:,3),U,V);

end

