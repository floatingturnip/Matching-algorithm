%[file, path] = uigetfile('.txt') % used for testing different files
file = 'names.txt';
%if filename is empty, stop the program
if file ~= 0
else
    return
end

%Open text file to read names line by line
fileID = fopen(file,'r');
initial_text = textscan(fileID, '%s %s')
original_list = strcat(initial_text{1}, {' '} ,initial_text{2});

% Randomizes the list of names
[numEntries,n] = size(original_list)
ii=randperm(numEntries)
[~,previous_order]=sort(ii)
randomized_list = original_list(ii)

num_participants = length(randomized_list)
group_size = 2

%Append original list with the new list made
split = round(num_participants/group_size)
partner = [randomized_list, original_list]
%TODO: Implement algorithm that prevents self-matching

%One person will know half the matches, the other person will know the other
%half of the matches, this allows organizers to participate in the secret
%santa exchange. They will have to manaully check if matches make sense
finaltable = cell2table(partner(1:split, 1:2),'VariableNames',{'Sender' 'Reciever' })
finaltable2 = cell2table(partner(split+1:end, 1:2),'VariableNames',{'Sender' 'Reciever' })
writetable(finaltable, 'names_1.txt', 'Delimiter', '\t')
writetable(finaltable2, 'names_2.txt', 'Delimiter', '\t')

