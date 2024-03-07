function combinedRegions = simpleAverage(dataIn)

fNames = fieldnames(dataIn);
L = length(fieldnames(dataIn));

combinedRegions = [];

%% Combination

for i = 1:L
    xi = dataIn.(fNames{i});
    l = size(xi);
    if(l(2)>1)
        xiCombined = sum(xi,2)/(l(2));
        combinedRegions = [combinedRegions, xiCombined];
    else
        combinedRegions = [combinedRegions, xi];
    end
end

end