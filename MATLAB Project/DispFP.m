function[]=DispFP(img)
% DISPFP reformats an image fingerprint into one line
% Inputs:
%   img: A 1-by-𝑛 logical row vector representing an image fingerprint
% Author: Rebecca Ngan
% Date: 31/08/23

% convert to double for calculations
img=double(img);

% change into string from logical
img=sprintf('%d',img);

% set up a counter to loop through as values skip by every 8 bits
idx=1;

% goes through loop only if input array is longer than 8 bits
if length(img)>8
    for i=1:8:length(img)
        if length(img)<i+8
             % prints if length is not more than 8 bits
            format(idx:(idx+length(img)-i))=img(i:length(img));
        else
            format(idx:(idx+7))=img(i:(i+7));
            % adds a space after every 8 bits
            format(idx + 8)=' ';
            idx=idx+9;
        end
    end
else
    format=img;
end
disp(format);
end