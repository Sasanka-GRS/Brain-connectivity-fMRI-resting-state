function sparsity(windowSize,lambda,subject)

%% Set default parameters

if(nargin==0)
    windowSize = 8;
    lambda = 2.5;
end

Num = windowSize; % Time window length

%% ------------------ subject ----------------------------

s1 = "..\combination\combined_data\";
s2 = "_data_combined.mat";
sub = s1+subject+s2;

x1 = load(sub).data;
s = size(x1);
N = s(2); % Number of nodes

x1 = x1';

Graphs_W = sparWindowLearnWeighted(x1,Num,lambda,N);
s1 = ".\graph_data\";
s2 = "_graph_SparWindowWeighted.mat";
sub = s1+subject+s2;
save(sub,"Graphs_W");

end