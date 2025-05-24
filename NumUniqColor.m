% Author and Developer: Dr. Taymaz Rahkar Farshi
% Color image quantization with peak-picking and color space
% https://doi.org/10.1007/s00530-020-00682-5
%  Journal of Multimedia Systems
% taymaz.farshi@gmail.com
% Istanbul 2020
% www.taymaz.dev
function [isz] = NumUniqColor(rgbImage)

[rows columns numberOfColorBands] = size(rgbImage);

% Extract the individual red, green, and blue color channels.
redChannel = rgbImage(:, :, 1);
greenChannel = rgbImage(:, :, 2);
blueChannel = rgbImage(:, :, 3);

% Construct the 3D color gamut (3D histogram).
gamut3D = zeros(256,256,256);
for column = 1: columns
    for row = 1 : rows
        rIndex = redChannel(row, column) + 1;
        gIndex = greenChannel(row, column) + 1;
        bIndex = blueChannel(row, column) + 1;
        gamut3D(rIndex, gIndex, bIndex) = gamut3D(rIndex, gIndex, bIndex) + 1;
    end
end
isz = 0;

for red = 1 : 256
    for green = 1: 256
        for blue = 1: 256
            if (gamut3D(red, green, blue) > 0)
                isz = isz+1;
            end
        end
    end
end

end

