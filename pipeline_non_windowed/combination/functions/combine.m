function data = combine(dataIn,option)

if(strcmp(option,'SA'))
    data = simpleAverage(dataIn);
else
    data = weightedAverage(dataIn);
end

end