function chosenVoxels = voxelClusteringKMeans(x,numClust)

chosenVoxels = x;

yPhase = x;
clusters = x;

fNames = fieldnames(x);
L = length(fieldnames(x));

%% Extract Phase

for i = 1:L-1
    xi = x.(fNames{i});
    l = size(xi);
    yi = xi;
    for p = 1:l(2)
        x1 = xi(:,p);
        ph1 = angle(fft(x1));
        yi(:,p) = ph1;
    end
    yPhase.(fNames{i}) = yi;
end

%% Clustering

for i = 1:L-1
    yi = yPhase.(fNames{i});
    xi = x.(fNames{i});
    l = size(xi);
    if(l(2)<2)
        clusters.(fNames{i}) = 1;
    else

        % K-Means
        clustersKMeans = kmeans(yi',numClust);

        clusters.(fNames{i}) = clustersKMeans;

    end
end

%% Selecting best cluster

for i = 1:L-1
    xi = x.(fNames{i});
    yi = yPhase.(fNames{i});
    l = size(xi);
    if(l(2)<=numClust)
        chosenVoxels.(fNames{i}) = xi;
    else
        clusterHere = clusters.(fNames{i});
        variance = zeros(numClust,1);
        for n = 1:numClust
            vPh = yi(:,clusterHere==n);
            variance(n) = norm(var(vPh),2);
        end
        [~,clustMin] = min(variance);
        v = xi(:,clusterHere==clustMin);
        chosenVoxels.(fNames{i}) = v;
    end
end

end