function similarity(windowSize,sigma,subject)

%% Set default parameters

if(nargin==0)
    windowSize = 8;
    sigma = 1;
end

Num = windowSize; % Time window length

%% ------------------ subject ----------------------------

s1 = "..\combination\combined_data\";
s2 = "_data_combined_M2.mat";
sub = s1+subject+s2;

x1 = load(sub).data;
s = size(x1);
N = s(2); % Number of nodes

Graphs_W = simWindowLearnWeighted(x1,Num,sigma,N);
s1 = ".\graph_data\";
s2 = "_graph_SimWindowWeighted_M2.mat";
sub = s1+subject+s2;
save(sub,"Graphs_W");

end