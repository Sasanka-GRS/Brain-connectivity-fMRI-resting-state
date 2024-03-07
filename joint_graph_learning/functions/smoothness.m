function smoothness(windowSize,alpha,beta,iter,subject)

%% Set default parameters

if(nargin==0)
    windowSize = 8;
    alpha = 4;
    beta = 10;
    iter = 100;
end

Num = windowSize; % Time window length

%% ------------------ 303 ----------------------------

s1 = "..\combination\combined_data\";
s2 = "_data_combined.mat";
sub = s1+subject+s2;

x1 = load(sub).data;
s = size(x1);
N = s(2); % Number of nodes

x1 = x1';

Graphs_W = smoothWindowLearnWeighted(x1,Num,alpha,beta,iter,N);
s1 = ".\graph_data\";
s2 = "_graph_SmoothWindowWeighted.mat";
sub = s1+subject+s2;
save(sub,"Graphs_W");

end