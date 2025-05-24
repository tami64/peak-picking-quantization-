% Author and Developer: Dr. Taymaz Rahkar Farshi
% Color image quantization with peak-picking and color space
% https://doi.org/10.1007/s00530-020-00682-5
%  Journal of Multimedia Systems
% taymaz.farshi@gmail.com
% Istanbul 2020
% www.taymaz.dev
function Peaks = FindPeaks( H )
Peaks = [];
if((H(1)>H(2))&&(H(2)>H(3)))
    Peaks = [Peaks,1];
end
for i = 2:255
    if (H(i-1)<H(i)) && H(i)>H(i+1)
        Peaks = [Peaks,i];
    end
end
if(H(256)>H(255)&&H(255)>H(254))
    Peaks = [Peaks,256];
end
end
