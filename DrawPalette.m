% Author and Developer: Dr. Taymaz Rahkar Farshi
% Color image quantization with peak-picking and color space
% https://doi.org/10.1007/s00530-020-00682-5
%  Journal of Multimedia Systems
% taymaz.farshi@gmail.com
% Istanbul 2020
% www.taymaz.dev
function [outputArg1,outputArg2] = DrawPalette(I,Hr,Hg,Hb,Pr,Pg,Pb)
%DRAWPALETTE Summary of this function goes here
%   Detailed explanation goes here

H3D = Hist3D(I);
Newr = StretchingHistHeight(Hr);
Newg = StretchingHistHeight(Hg);
Newb = StretchingHistHeight(Hb);
figure

t = 0:255;
v = zeros(1,256);


plot3(t,v,Newr,'r', 'LineWidth',2)
hold on
plot3(Pr,zeros(1,numel(Pr)),Newr(Pr),'r*', 'LineWidth',2)
plot3(v'+Pr(1:end),v,[1:256],'r-', 'LineWidth',1)

plot3(v,t,Newg,'g', 'LineWidth',2)
plot3(zeros(1,numel(Pg)),Pg,Newg(Pg),'g*', 'LineWidth',2)
plot3(v,v'+Pg(1:end),[1:256],'g-', 'LineWidth',1)

plot3(Newb,v+255,t,'b', 'LineWidth',2)
plot3(Newb(Pb),zeros(1,numel(Pb))+255,Pb,'b*', 'LineWidth',2)
plot3([1:256],v+255,v'+Pb(1:end),'b-', 'LineWidth',1)

% axis tight
grid on
ColorSpace(H3D);
alpha(0.15)

for i = 1:numel(Pr)
    for j = 1:numel(Pg)
        for k = 1:numel(Pb)
            plot3(Pr(i),Pg(j),Pb(k),'ro','LineWidth',1.5)
            plot3(Pr(i),Pg(j),Pb(k),'y*')
        end
    end
end

hold off
set(gca,'FontSize',12,'FontWeight','Bold')

end

