function[ResizedImg]=ResizeBox(img,resize)
% RESIZEBOX resizes an image using box sampling algorithm by finding the
% average pixel value given a group of pixels from the original image
% Inputs:
%   img: An 𝑚-by-𝑛-by-𝑝 uint8 array representing a greyscale (𝑝 = 1) or a RGB colour (𝑝 = 3)
%   image
%   resize: A 1-by-2 double array containing two values (𝑖, 𝑗) representing the desired height 𝑖 (i.e.,
%   𝑖 rows) and width 𝑗 (i.e., 𝑗 columns) to resize the image to
% Outputs:
%  ResizedImg:  An 𝑖-by-𝑗-by-𝑝 uint8 array representing the resized greyscale (𝑝 = 1) or RGB colour
%  (𝑝 = 3) image
% Author: Rebecca Ngan
% Date: 06/09/23

% converting to double for calculations
img=double(img);

% setting variable names for rows, cols and layers
[row,col,p]=size(img);

% width and height to resize to
i_r=resize(1);
j_r=resize(2);

% intitializing the array
ResizedImg=zeros(i_r,j_r,p);

% finding the spacing of boxes relative to image (box boundaries)
i_n=row/i_r;
j_n=col/j_r;

for k=1:p
    for i=1:i_r
        for j=1:j_r
            % calculating lower and upper bounds for boundary boxes
            % rounding down if boundary is halfway through a pixel
            lbx=round(((i - 1) * i_n) + 0.9999999);
            ubx=round(i*i_n);
    
            lby=round(((j-1)*j_n)+ 0.9999999);
            uby=round(j*j_n);
            
            % creating an array with the bounds of the box and averaging it
            box=img(lbx:ubx,lby:uby,k);
            avg=round(sum(box,'all')./numel(box));

            % inserting new values into the array
            ResizedImg(i,j,k)=avg;
        end
    end
end
% converting back to uint8
ResizedImg=uint8(ResizedImg);
end