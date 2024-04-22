function[ResizedImg]=ResizeNearest(img,resize)
% RESIZENEAREST uses the Nearest Neighbour Interpolation algorithm to resize an
%image to the specified dimensions
% Inputs:
%   img: An 𝑚-by-𝑛-by-𝑝 uint8 array representing a greyscale (𝑝 = 1) or a RGB colour (𝑝 = 3)
%   image
%   resize: A 1-by-2 double array containing two values (𝑖, 𝑗) representing the desired height 𝑖 (i.e.,
%   𝑖 rows) and width 𝑗 (i.e., 𝑗 columns) to resize the image to
% Outputs:
%  ResizedImg:  An 𝑖-by-𝑗-by-𝑝 uint8 array representing the resized greyscale (𝑝 = 1) or RGB colour
%  (𝑝 = 3) image
% Author: Rebecca Ngan
% Date: 30/08/23

% converting to double for calculations
img=double(img);

% setting variable names for rows, cols and layers
[rowO,colO,p]=size(img);


i_r=resize(1);
j_r=resize(2);

% initialising an array based on ideal width and height
ResizedImg=zeros(i_r,j_r,p);


for k=1:p 
    for i=1:i_r
        for j=1:j_r 
            % nearest neighbor interpolation calculations
            row=rowO/i_r;
            col=colO/j_r;
            
            i_o=ceil((i-0.5)*row);
            j_o=ceil((j-0.5)*col);
                        
                        
            % assigning values of i_o and j_o to resized image
            ResizedImg(i,j,p)=img(i_o,j_o,p);
            
        end
    end
end

% converting back to uint8
ResizedImg=uint8(ResizedImg);

end