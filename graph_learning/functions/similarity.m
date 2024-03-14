function similarity(sigma,subject)

%% ------------------ subject ----------------------------

s1 = "..\combination\combined_data\";
s2 = "_data_combined.mat";
sub = s1+subject+s2;

x1 = load(sub).data;
s = size(x1);
N = s(2); % Number of nodes

Graphs_W = simWindowLearnWeighted(x1,sigma,N);
s1 = ".\graph_data\";
s2 = "_graph_SimWindowWeighted_M1_single.mat";
sub = s1+subject+s2;
save(sub,"Graphs_W");

end