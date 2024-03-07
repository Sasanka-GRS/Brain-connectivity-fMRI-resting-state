function data = clusterMine(dataIn,option1,option2)

if(strcmp(option1,'KM'))
    data = voxelClusteringKMeans(dataIn,option2);
else
    data = voxelClusteringISRM(dataIn,option2);
end

end