function[avg]=AvgHash(grey)
% AVGHASH uses the Average Hashing algorithm to convert an 𝑚-by-𝑛 greyscale image
% into a hash containing 𝑚𝑛 bits
% Inputs:
%  grey: An 𝑚-by-𝑛 uint8 array representing a greyscale image
% Outputs:
%  avg: A 1-by-𝑚𝑛 logical row vector representing the average hash of the greyscale image
% Author: Rebecca Ngan
% Date: 30/08/23

% finding average pixel value
average= round(mean(mean(grey)));
disp(grey)
disp(average)

for i=1:size(grey,1)
    for j=1:size(grey,2)

        % if pixel is greater or equal to average value, is represented by
        % logical true
        if grey(i,j)>=average
            grey(i,j)=true;
        else
            grey(i,j)=false;
        end

        % creating logical array
        logic(i,j)=(grey(i,j));

    end   
end

% converting from array to row vector
transpose=logic.';
avg=transpose(:);
avg=avg.';

avg=logical(avg);

end