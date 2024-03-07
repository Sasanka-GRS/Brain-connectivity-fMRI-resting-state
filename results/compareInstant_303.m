clc
clear

%% Add dependencies
addpath(".\functions\");

%% Load data
GraphsSim = load("..\graph_learning\graph_data\303_graph_SimWindowWeighted.mat").Graphs_W;
GraphsSmooth = load("..\graph_learning\graph_data\303_graph_SmoothWindowWeighted.mat").Graphs_W;
GraphsSpar = load("..\graph_learning\graph_data\303_graph_SparWindowWeighted.mat").Graphs_W;
GraphsPear = load("..\graph_learning\graph_data\303_graph_PearWindowWeighted.mat").Graphs_W;

time = 5;

Asim = GraphsSim(:,:,time);
Asmooth = real(GraphsSmooth(:,:,time));
Aspar = real(GraphsSpar(:,:,time));
APear = GraphsPear(:,:,time);

N = size(Asim);
N = N(1);

Matrices = zeros(N,N,4);
Matrices(:,:,1) = Asim;
Matrices(:,:,2) = Asmooth;
Matrices(:,:,3) = Aspar;
Matrices(:,:,4) = APear;

%% Calculate adjacency matrix distances
compare = zeros(4);

for i=1:4
    for j=1:4
        compare(i,j) = norm(Matrices(:,:,i)-Matrices(:,:,j),'fro');
    end
end

%% Display
T = array2table(compare,'VariableNames',{'Similarity','Sparsity','Smoothness','Pearson'},'RowName',{'Similarity','Sparsity','Smoothness','Pearson'});
disp(T);