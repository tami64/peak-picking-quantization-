% Author and Developer: Dr. Taymaz Rahkar Farshi
% Color image quantization with peak-picking and color space
% https://doi.org/10.1007/s00530-020-00682-5
%  Journal of Multimedia Systems
% taymaz.farshi@gmail.com
% Istanbul 2020
% www.taymaz.dev
function [ H ] = Hist3D( I )

H=zeros(256,256,256);
[U,V,Z] = size(I);

for u = 1:U
    for v = 1:V
        r = I(u,v,1);
        g = I(u,v,2);
        b = I(u,v,3);
        H(r+1,g+1,b+1) = H(r+1,g+1,b+1)+1;
    end
end

end

