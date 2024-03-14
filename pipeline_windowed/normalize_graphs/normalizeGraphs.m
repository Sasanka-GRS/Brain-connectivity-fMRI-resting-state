function normalizeGraphs(subject)

s1 = "..\graph_learning\graph_data\";
s2 = "_graph_";
s4 = "WindowWeighted_M2.mat";

methods = ["Sim", "Pear", "Spar"];

for i = 1:length(methods)
    s3 = methods(i);
    sub = s1+subject+s2+s3+s4;
    graph = load(sub).Graphs_W;
    S = size(graph);
    L = S(3);

    for j = 1:L
        G = graph(:,:,j);
        froNorm = norm(G,'fro');
        graph(:,:,j) = G/froNorm;
    end

    graphOut.(s3) = graph;
end

%% Save

s1 = ".\normalized_graphs\";
s2 = "_normalizedGraphs_M2.mat";
sub = s1+subject+s2;

save(sub,"graphOut");

end