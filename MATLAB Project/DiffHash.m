function[hash]=DiffHash(grey)
% DIFFHASH takes a greyscale array and turns it into a hash by comparing a
% pixel to the pixel to the right of itself
% Inputs:
%  grey: An 𝑚-by-(𝑛 + 1) uint8 array representing a greyscale image
% Outputs:
%  hash: A 1-by-𝑚𝑛 logical row vector representing the differential hash of the greyscale image
% Author: Rebecca Ngan
% Date: 3/09/23

% assuming n>0

logic=zeros(1,length(grey));
for i=1:size(grey,1)
    % does not consider furthermost right column as there is nothing to
    % compare to
    for j=1:size(grey,2)-1

        % if pixel is greater or equal to the pixel to it's right, is represented by
        % logical true
        if grey(i,j)>=grey(i,j+1)
            grey(i,j)=true;
        else
            grey(i,j)=false;
        end
        % creating logical array
        logic(i,j)=(grey(i,j));

    end   
end

% transposing into a row vector
transpose=logic.';
hash=transpose(:);
hash=hash.';

hash=logical(hash);

end