function data = hpf(dataIn,option)

%% Define cutoffs

wstop = 0.043;
wpass = 0.051;

%% HPF

[yFIRLS,yFIREQ] = voxelHPF(dataIn, wstop, wpass);

%% Choosing based on input

data = yFIRLS;

if strcmp(option,'EQ')
    data = yFIREQ;
end

end