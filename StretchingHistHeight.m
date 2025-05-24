function [newH] = StretchingHistHeight(H)
%STRETCHINGHISTHEIGHT Summary of this function goes here
%   Detailed explanation goes here

Mx = max(H);
Mn = min(H);
newH = (H-Mn)*((200)/(Mx-Mn));

end

