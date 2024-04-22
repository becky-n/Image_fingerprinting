function[fp_collection]=FingerprintCollection(filenames,hash,resize)
% FINGERPRINTCOLLECTION stores all of the image fingerprints from a list of
% image filenames to make them easier to compare
% Inputs:
%  filenames: An 𝑚-by-1 string array representing a list of image file names
%  hash: A character vector containing either 'AvgHash' or 'DiffHash'
%  nearest: A character vector containing either 'Nearest' or 'Box'
% Outputs: 
%  fp_collection: An 𝑚-by-1 cell array containing the fingerprint from each image file
% Author: Rebecca Ngan
% Date: 6/09/23

% initialise cell array with size of m-by-1
fp_collection=cell(size(filenames,1),1);

for i=1:length(filenames)
    % read through each file from given string array
    file=imread(filenames(i));

    % call ImageFingerprint to create a fingerprint
    fp=ImageFingerprint(file,hash,resize);

    % assign new data to the cell array
    fp_collection{i}=fp;
end
end