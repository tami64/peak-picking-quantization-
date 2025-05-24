% Author and Developer: Dr. Taymaz Akan
% Color image quantization with peak-picking and color space
% https://doi.org/10.1007/s00530-020-00682-5
%  Journal of Multimedia Systems
% taymaz.farshi@gmail.com
% Istanbul 2020

%Generates grid arrays for all combinations of red, green, and blue peaks.
%If Pr = [r1 r2], Pg = [g1 g2 g3], and Pb = [b1 b2], this will generate three 3D matrices where each element corresponds to one combination (like a meshgrid).

function [peaks] = peaks2vec(Pr,Pg,Pb)

c={Pr,Pg,Pb};
[c{:}]=ndgrid(c{:});
n=length(c);
peaks = reshape(cat(n+1,c{:}),[],n);


end

