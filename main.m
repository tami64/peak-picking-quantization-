% Author and Developer: Dr. Taymaz Akan
% Color image quantization with peak-picking and color space
% https://doi.org/10.1007/s00530-020-00682-5
% Journal of Multimedia Systems
% taymaz.farshi@gmail.com
% Istanbul 2020
clear ,close all;clc

palleteshow = 1; % plot color Palette   0: off   1: on  It takes long

[FileName,PathName] = uigetfile('*.tif;*.bmp;*.png;*.jpg','Select file','.\');
I = imread(strcat(PathName,FileName));
[U V Z] = size(I);
H3D = Hist3D(I);  % Calculate 3D histogarm

Hr  = Gaussian_(I,1); %Apply gaussian filter on red channel 
Hg  = Gaussian_(I,2); %Apply gaussian filter on green channel 
Hb  = Gaussian_(I,3); %Apply gaussian filter on blue channel 

Pr = FindPeaks(Hr); %Locating the peakes on red channel 
Pg = FindPeaks(Hg); %Locating the peakes on green channel 
Pb = FindPeaks(Hb); %Locating the peakes on blue channel 

tic
peaks = peaks2vec(Pr,Pg,Pb); % The function peaks2vec combines the peak positions from the red, green, and blue channels into a matrix where each row represents a combination of one peak from each channel.

[x y] = size(peaks);

for i = x:-1:1
    peakRGB = H3D(peaks(i,1),peaks(i,2),peaks(i,3));
    if peakRGB==0
        peaks(i,:) = [];
    end
end


I_Vec = im2vec (I);

Dist = pdist2(I_Vec,peaks); %pdist2 is a MATLAB function that computes pairwise distances between two sets of observations (rows of matrices).
[~,Ind] = min(Dist,[],2); %For each pixel in I_Vec, finds the index of the nearest peak.
uniqLabel = unique(Ind); %Identifies which peaks were closest to at least one pixel.


uniqPeak = [];
NumofClusters = numel(unique(Ind));
% I2_vec = peaks(Ind,:);
I2_vec = uint8(zeros(U*V,3));
%% mean of cluster member
for i = 1:numel(uniqLabel)
    [x,y]=find(Ind==uniqLabel(i));
    temp = round(mean(I_Vec(x,:),1));
    I2_vec(x,1) =temp(1);
    I2_vec(x,2) =temp(2);
    I2_vec(x,3) =temp(3);
    uniqPeak = [uniqPeak; temp]

end
I2 = uint8(Vec2im(I2_vec,U,V));
toc
imshow(I2,[]);

Psnr_ = psnr(I,I2);
Mse_= mean(mse(I,I2));
Ssim_ = (ssim(I,I2));
%%


%%
RunTime = toc;


UniqOrj = NumUniqColor(I);
disp(['Num of Uniq Color Quantized Image: ', num2str(NumofClusters)]);
disp(['Num of Uniq Color Original Image: ', num2str(UniqOrj)]);
disp(['PSNR: ', num2str(Psnr_)]);
disp(['MSE: ', num2str(Mse_)]);
disp(['SSIM: ', num2str(Ssim_)]);


figure;
imshow(I2);

DrawRGBhist(Hr,Hg,Hb,Pr,Pg,Pb)
if palleteshow
    %DrawPalette(I,Hr,Hg,Hb,Pr,Pg,Pb);
    DrawPalette(I,Hr,Hg,Hb,uniqPeak(:,1)',uniqPeak(:,2)',uniqPeak(:,3)');
end

