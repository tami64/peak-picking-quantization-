% Author and Developer: Dr. Taymaz Rahkar Farshi
% Color image quantization with peak-picking and color space
% https://doi.org/10.1007/s00530-020-00682-5
%  Journal of Multimedia Systems
% taymaz.farshi@gmail.com
% Istanbul 2020
% www.taymaz.dev
function [Hr] = colorseg()
global I;
I = imread('pic\cameraman.jpg');
imshow(I);
r=I(:,:,1);
b=I(:,:,2);
g=I(:,:,3);
Hr=T2dhist(r,b,1,2);
Hb=T2dhist(r,g,1,3);
Hg=T2dhist(b,g,2,3);
figure;
surf(Hr);
figure;
surf(Hb);
figure;
surf(Hg);

h = fspecial('gaussian', [5 5], 1.5);
%%
R = imfilter(Hr,h);
figure;
surf(R);

end