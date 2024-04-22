function[grey]=GreyscaleLuma(rgb)
% GREYSCALELUMA takes an RGB colour image and converts it to a greyscale
% version by calculating a weighted sum for each pixel
% Inputs:
%   rgb: An 𝑚-by-𝑛-by-3 uint8 array representing an RGB colour image
% Outputs:
%  grey:  An 𝑚-by-𝑛-by-1 uint8 array representing a greyscale image
% Author: Rebecca Ngan
% Date: 29/08/23

% converting to double for calculations
rgb=double(rgb);

for i=1:size(rgb,1)
    for j=1:size(rgb,2)
        for k=1:size(rgb,3)
            r=rgb(i,j,1);
            g=rgb(i,j,2);
            b=rgb(i,j,3);
            % weighted sum formula
            grey(i,j)=round(0.2126*r+0.7152*g+0.0722*b);
        end
    end
end

% converting back to uint8 
grey=uint8(grey);
end