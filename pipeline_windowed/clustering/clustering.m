function clustering(option1,option2,subject)

%% Set default to LS

if(nargin==0)
    option1 = 'KM';
    option2 = 3;
elseif (nargin==1 && strcmp(option1,'KM'))
    option2 = 3;
elseif (nargin==1 && strcmp(option1,'ISRM'))
    option2 = 0.5;
end

%% Add dependencies

addpath(".\functions");

%% 

s1 = "..\hpf\hpf_data\";
s2 = "_data_voxel_N_hpf_M2.mat";
sub = s1+subject+s2;

dataIn = load(sub).data;
data = clusterMine(dataIn,option1,option2);

s1 = ".\clustered_data\";
s2 = "_data_clustered_M2.mat";
sub = s1+subject+s2;

save(sub,"data");

end

