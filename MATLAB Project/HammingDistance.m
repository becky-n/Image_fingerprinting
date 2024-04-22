function[ham]=HammingDistance(f1,f2)
% HAMMINGDISTANCE takes two image fingerprints and compares them to each
% other to find out how many places they are different at
% Inputs: 
%  f1: A 1-by-𝑛 logical row vector for fingerprint f1
%  f2: A 1-by-𝑛 logical row vector for fingerprint f2
% Outputs:
%  ham: A integer representing the number of differing bits between
%  fingerprints f1 and f2
% Author: Rebecca Ngan
% Date: 2/09/23

% initialising an empty array of same size of original logical array
str=zeros(1,length(f1));
str2=zeros(1,length(f2));


% insert every value of logical array into new array to convert from
% logical to string
for i=1:length(f1)
    str(i)=f1(i);
end
str=string(str);

for i=1:length(f2)
    str2(i)=f2(i);
end

str2=string(str2);

% compare logical arrays with each other
find1=strcmp(str2,str)

% convert new logical array from comparing to string
new_str=zeros(1,length(find1));

for i=1:length(find1)
    new_str(i)=find1(i);
end
new_str=string(new_str);

% add all the strings into one string
form=join(new_str);

% remove whitespace inbetween characters in string
form = strrep(form,' ','');

% find how many positions there are when the values are not the same
find0=strfind(form,'0');

% count how many positions there are where it is not the same
ham=length(find0);


end