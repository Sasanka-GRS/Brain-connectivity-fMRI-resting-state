function extractData(subject)

data = [];
nodes = [];

s1 = "..\data\";
s2 = "Data_M2.mat";
sub = s1+subject+s2;

X = load(sub).extractedData;

Y = X;
fNames = fieldnames(X);
R = length(fieldnames(X));
nodes = [];

for i = 1:R
    y = X.(fNames{i});
    Y.(fNames{i}) = y(4:end-3,:);
    nodes = [nodes, fNames{i}];
end

s1 = ".\extracted_data\";
s2 = "_data_voxel_M2.mat";
sub = s1+subject+s2;

data = Y;

save(sub,"data");

end