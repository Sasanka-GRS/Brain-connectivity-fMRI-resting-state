function output = find_region(input,mode)

% Mode 1 for input as number and extract region name
% Mode 2 for input as name and extract region number

names = load('..\extract_data\nodeLabels.mat').names;
numbers = load('..\extract_data\nodeLabels.mat').numbers;

if(~isstring(input))
    input = string(input);
end

if(mode==1)
    output = names(numbers==input);
else
    output = numbers(names==input);
end

disp(output)

end

