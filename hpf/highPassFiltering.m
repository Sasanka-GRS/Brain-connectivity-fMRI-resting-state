function highPassFiltering(option,subject)

%% Set default to LS

if(nargin==0)
    option = 'LS';
end

%% Add dependencies

addpath(".\functions");

%% 

s1 = "..\normalize_data\normalized_data\";
s2 = "_data_voxel_N_RS.mat";
sub = s1+subject+s2;

dataIn = load(sub).data;
data = hpf(dataIn,option);

s1 = ".\hpf_data\";
s2 = "_data_voxel_N_hpf_RS.mat";
sub = s1+subject+s2;

save(sub,"data");

%%

clc

end