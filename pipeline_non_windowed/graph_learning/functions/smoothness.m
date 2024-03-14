function smoothness(alpha,beta,iter,subject)

%% ------------------ 303 ----------------------------

s1 = "..\combination\combined_data\";
s2 = "_data_combined.mat";
sub = s1+subject+s2;

x1 = load(sub).data;
s = size(x1);

x1 = x1';

Graphs_W = smoothWindowLearnWeighted(x1,alpha,beta,iter);
s1 = ".\graph_data\";
s2 = "_graph_SmoothWindowWeighted_M1_single.mat";
sub = s1+subject+s2;
save(sub,"Graphs_W");

end