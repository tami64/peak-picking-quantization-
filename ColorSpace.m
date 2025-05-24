% Author and Developer: Dr. Taymaz Rahkar Farshi
% Color image quantization with peak-picking and color space
% https://doi.org/10.1007/s00530-020-00682-5
%  Journal of Multimedia Systems
% taymaz.farshi@gmail.com
% Istanbul 2020
% www.taymaz.dev
function [ output_args ] = ColorSpace( Hist )

%COLORSPACE Summary of this function goes here
%   Hist = 3D Histogram
%   Ccolor distribution in RGB Color space

disp('Deawing the colorspace ...')
rng(9,'twister')
data = Hist;
% data = smooth3(data,'box',5);
patch(isocaps(data,.5),...
   'FaceColor','interp','EdgeColor','none');
p1 = patch(isosurface(data,.5),...
   'FaceColor','blue','EdgeColor','none');
isonormals(data,p1)
% view(3); 
% axis vis3d tight
% camlight left; 
% colormap jet
% lighting gouraud

set(gca, 'XColor', 'r','YColor', 'g', 'ZColor', 'b');
%set(gca, 'XColor', 'r','YColor', [0 0.7 0], 'ZColor', 'b');
% set(gcf, 'color', 'none');
% set(gca, 'color', 'none');
axis([ 0 255 0 255 0 255]);
xlabel('R');
ylabel('G');
zlabel('B');
camlight(14,36);
rotate3d on 
view(14,36)
axis square
grid on
colormap hsv
view([-45, -45,30]);
end