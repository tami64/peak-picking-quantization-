% Author and Developer: Dr. Taymaz Rahkar Farshi
% Color image quantization with peak-picking and color space
% https://doi.org/10.1007/s00530-020-00682-5
%  Journal of Multimedia Systems
% taymaz.farshi@gmail.com
% Istanbul 2020
% www.taymaz.dev
function [outputArg1,outputArg2] = DrawRGBhist(Hr,Hg,Hb,Pr,Pg,Pb)
%DRAWRGBHIST Summary of this function goes here
%   Detailed explanation goes here

figure
plot(1:256,Hr,'r');
hold on
plot(1:256,Hg,'g');
plot(1:256,Hb,'b');
plot(round(Pr),Hr(Pr),'r*');
plot(round(Pg),Hg(Pg),'g*');
plot(round(Pb),Hb(Pb),'b*');
mx = max([max(Hr),max(Hg),max(Hb)]);
xlabel('Intensity','FontSize', 14,'FontWeight','Bold');
ylabel('No. of Pixels','FontSize', 14,'FontWeight','Bold');
set(gca,'FontSize',12,'FontWeight','Bold')
hold off
 axis([0 258 0 ,mx+10])
end

