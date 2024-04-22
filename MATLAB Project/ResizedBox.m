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

% to find spacing of boxes relative to image (box boundaries)
i_n=row/i_r;
j_n=col/j_r;

% counter to loop through box boundaries
x=0;

for k=1:p
    for i=1:i_r
        for j=1:j_r
            
            % loops through until end of resized loop to repeat box
            % boundary for calculations
            for l=1:i_r
                     for m=1:j_r
                         % try combining it??
                        
                        % if height is exactly half, round down from 0.5
                        if mod(row*i_n*x,1)==0.5
                            lbx=floor(((i - 1) * i_n) + 1);
                            ubx=round(i*i_n);
                            % boundary and position in resized img and
                            % rounds up
                        else
                            lbx=round(((i - 1) * i_n) + 1);
                            ubx=round(i*i_n);
                        end
                        
                        % if width is exactly half, round down from 0.5
                        if mod((col*j_n*x),1)==0.5
                            lby=floor(((j-1)*j_n)+1);
                            uby=round(j*j_n);
                        else
                            % finds position of pixel relative to box
                            % boundary and position in resized img and rounds up
                            lby=round(((j-1)*j_n)+1);
                            uby=round(j*j_n);
                        end
                     end
            x=x+1;
            end
         
            
            % calculating average for each box
           box=img(lbx:ubx,lby:uby,k);
           avg=sum(box,'all')./numel(box);

            
            % inserting new values into resized array
            ResizedImg(i,j,k)=avg;

            
            % updating counter for box boundaries
           
        
        end
    end
end

% converting back to uint8
ResizedImg=uint8(ResizedImg);



end