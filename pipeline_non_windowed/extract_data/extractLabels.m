%% Load region locations file

masks = load("..\data\MNI_allMasks.mat");

%% Extract labels for regions

fNames = fieldnames(masks);
L = length(fieldnames(masks));

nodes = [];

for i = 1:L
    Ri = fNames{i};
    chr = convertStringsToChars(Ri);
    if(chr(end)=='l')
        chr(end) = 'L';
    elseif(chr(end)=='r')
        chr(end) = 'R';
    end
    nodes = [nodes,string(chr)];
end

%% Save layout

save("nodeLabels.mat","nodes");