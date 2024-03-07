function combinedRegions = weightedAverage(dataIn)

fNames = fieldnames(dataIn);
L = length(fieldnames(dataIn));

combinedRegions = [];
meanRegions = [];

%% Finding Means

for i = 1:L-1
    xi = dataIn.(fNames{i});
    l = size(xi);
    if(l(2)>1)
        xiCombined = sum(xi,2)/(l(2));
        meanRegions = [meanRegions, xiCombined];
    else
        meanRegions = [meanRegions, xi];
    end
end

%% Finding Distance from Mean and Combining

for i = 1:L-1
    xi = dataIn.(fNames{i});
    l = size(xi);
    if(l(2)>1)
        for j = 1:l(2)
            d = norm(meanRegions(i)-xi(j),2);
            xiCombined = xiCombined + xi(j)/d;
        end
        combinedRegions = [meanRegions, xiCombined];
    else
        combinedRegions = [meanRegions, xi];
    end
end

end