function[ResizedImg]=ResizeBox(img,resize)
% converting to double for calculations
img=double(img);
% setting variable names for rows, cols and layers
[row,col,p]=size(img);
% width and height to resize to, number of boxes?
i_r=resize(1);
j_r=resize(2);

new=zeros(i_r,j_r,p);
% to find spacing of boxes relative to image
i_n=row/i_r;
j_n=col/j_r;

x=0;

for k=1:p
    for i=1:i_r
        for j=1:j_r

         
            ubx=round(i*i_n);
            uby=round(j*j_n);

            for l=1:length(i_r)
                     for m=1:length(j_r)
        
                        if mod(row*i_n*x,1)==0.5
                            lbx=floor(((i-1)*i_n)+1);
                        else
                            lbx=ceil(((i - 1) * i_n) + 1);
                        end
            
                        if mod((col*j_n*x),1)==0.5
                            lby=floor(((j-1)*j_n)+1);
                        else
                            lby=ceil(((j-1)*j_n)+1);
                        end
            
                     end
            end

            box=round(mean(mean(img(lbx:ubx,lby:uby,k))));
            
            ResizedImg(i,j,k)=box;
            
            x=x+1;
        
        end
    end
end
end