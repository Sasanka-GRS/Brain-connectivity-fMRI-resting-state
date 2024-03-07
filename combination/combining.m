function combining(option,subject)

%% Set default to SA

if(nargin==0)
    option = 'SA';
end

%% Add dependencies

addpath(".\functions");

%% 

s1 = "..\clustering\clustered_data\";
s2 = "_data_clustered_RS.mat";
sub = s1+subject+s2;

dataIn = load(sub).data;
data = combine(dataIn,option);

s1 = ".\combined_data\";
s2 = "_data_combined_RS.mat";
sub = s1+subject+s2;

save(sub,"data");

end