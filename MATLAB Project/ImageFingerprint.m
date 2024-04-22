function[fingerprint]=ImageFingerprint(rgb_img, hash, resize)
% IMAGEFINGERPRINT creates a 64-bit image fingerprint for a colour image
% using hashing and resizing algorithms
% Inputs:
%  rgb_img: An 𝑚-by-𝑛-by-3 uint8 array representing a colour image
%  avg: A character vector containing either 'AvgHash' or 'DiffHash'
%  nearest: A character vector containing either 'Nearest' or 'Box'
% Outputs: 
%  fingerprint: A 1-by-64 logical row vector representing the image fingerprint
% Author: Rebecca Ngan
% Date: 6/09/23

% converting from rgb to greyscale 
grey=GreyscaleLuma(rgb_img);

% checking if it contains avg hash or diff hash to resize to a certain size
if contains(hash,'AvgHash')
     if contains(resize,'Box')
        new_size=ResizeBox(grey,[8 8]);
     else
         new_size=ResizeNearest(grey,[8 8]);
     end
    % hash resized fingerprint
    fingerprint=AvgHash(new_size);
else
    if contains(resize,'Box')
        new_size=ResizeBox(grey,[8 9]);
    else
        new_size=ResizeNearest(grey,[8 9]);
    end
    % hash resized fingerprint
    fingerprint=DiffHash(new_size);
end

end