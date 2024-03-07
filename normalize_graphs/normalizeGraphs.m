function normalizeGraphs(subject)

s1 = "..\graph_learning\graph_data\";
s2 = "_graph_";
s4 = "WindowWeighted_RS.mat";

methods = ["Sim", "Pear", "Spar","Smooth"];

for i = 1:length(methods)
    s3 = methods(i);
    sub = s1+subject+s2+s3+s4;
    graph = load(sub).Graphs_W;

    G = graph;
    froNorm = norm(G,'fro');
    graph = G/froNorm;

    graphOut.(s3) = graph;
end

%% Save

s1 = ".\normalized_graphs\";
s2 = "_normalizedGraphs_RS.mat";
sub = s1+subject+s2;

save(sub,"graphOut");

end