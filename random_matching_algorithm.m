%[file, path] = uigetfile('.txt')
file = 'names.txt';
if file ~= 0
else
    return
end

fileID = fopen(file,'r');
A = textscan(fileID, '%s');
B = A{1};

[numEntries,n] = size(B)
ii=randperm(numEntries)
[~,previous_order]=sort(ii)

C = B(ii)

half = floor(numEntries/2)
column1 = C(1:half)
column2 = C(half + 1:numEntries)

final = horzcat(column1, column2)
finaltable = cell2table(final)
writetable(finaltable, 'matched_names.txt', 'Delimiter', '\t')
