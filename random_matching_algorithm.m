%[file, path] = uigetfile('.txt') % used for testing different files
file = 'names.txt';
if file ~= 0
else
    return
end

fileID = fopen(file,'r');
initial_text = textscan(fileID, '%s');
original_list = initial_text{1};

[numEntries,n] = size(original_list)
ii=randperm(numEntries)
[~,previous_order]=sort(ii)

randomized_list = original_list(ii)
num_participants = length(randomized_list)
group_size = 3
divisible_number = num_participants + (group_size - rem(num_participants,group_size))
divisible_randomized_list = cell(1,divisible_number)
divisible_randomized_list(1:num_participants) = randomized_list

partner = reshape(divisible_randomized_list, group_size, [])'

finaltable = cell2table(partner)
writetable(finaltable, 'matched_names.txt', 'Delimiter', '\t')
