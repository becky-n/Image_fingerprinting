function[]=RankSimilarity(img_fp,filenames,fp_collection,n)
% RANKSIMILARITY takes a collection fingerprints and ranks how similar they
% are to each other with the most similar image ranked at the top
% Inputs:
%  img_fp: A 1-by-64 logical row vector representing the image fingerprint to search
%  filenames: An 𝑚-by-1 string array representing a list of image file names
%  fp_collection: An 𝑚-by-1 cell array containing a collection of image fingerprints
%  n: An integer 𝑛 denoting how many image fingerprint matches to display
%
% Author: Rebecca Ngan
% Date: 7/09/23

% initialising an array to store hamming distance in
diff=zeros(length(fp_collection),1);

% calculating hamming distance from given files and the original image
for j=1:length(filenames)
    diff(j)=HammingDistance(img_fp,fp_collection{j});   
end

% arranging the files rank based on hamming distance value
[l,m]=sort(diff,'ascend');
org=filenames(m);

for i=1:n
    if n<=9
        if l(i)<=9
            % if hamming distance is a double digit, add an extra space
            fprintf('%d. %2d - %-1s\n',i,l(i),org{i});   
        else
            fprintf('%d. %d - %-1s\n',i,l(i),org{i})
        end   
    else
        % add a space in front of r if n is more than 9
        if l(i)<=9
            fprintf('%2d. %2d - %-1s\n',i,l(i),org{i});
        else
            fprintf('%2d. %d - %-1s\n',i,l(i),org{i});
        end
    end
end
end
