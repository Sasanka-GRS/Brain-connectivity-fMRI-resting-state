clc
clear

%% Load data
GraphsSim = load("..\graph_learning\graph_data\303_graph_SimWindowWeighted.mat");
GraphsSmooth = load("..\graph_learning\graph_data\303_graph_SmoothWindowWeighted.mat");
GraphsSpar = load("..\graph_learning\graph_data\303_graph_SparWindowWeighted.mat");
GraphsPear = load("..\graph_learning\graph_data\303_graph_PearWindowWeighted.mat");

%% Similarity
N1 = size(GraphsSim.Graphs_W);
N = N1(3);
edgeFreqSim = zeros(N1(1));
nodeFreqSim = zeros(N1(1),1);

for i = 1:N

    edgeFreqSim = edgeFreqSim + GraphsSim.Graphs_W(:,:,i);
    nodeFreqSim = nodeFreqSim + sum(GraphsSim.Graphs_W(:,:,i),2);

end

%% Smoothness
N1 = size(GraphsSmooth.Graphs_W);
N = N1(3);
edgeFreqSmooth = zeros(N1(1));
nodeFreqSmooth = zeros(N1(1),1);

for i = 1:N

    edgeFreqSmooth = edgeFreqSmooth + GraphsSmooth.Graphs_W(:,:,i);
    nodeFreqSmooth = nodeFreqSmooth + sum(GraphsSmooth.Graphs_W(:,:,i),2);

end

%% Sparsity
N1 = size(GraphsSpar.Graphs_W);
N = N1(3);
edgeFreqSpar = zeros(N1(1));
nodeFreqSpar = zeros(N1(1),1);

for i = 1:N

    edgeFreqSpar = edgeFreqSpar + GraphsSpar.Graphs_W(:,:,i);
    nodeFreqSpar = nodeFreqSpar + sum(GraphsSpar.Graphs_W(:,:,i),2);

end

%% Pearson
N1 = size(GraphsPear.Graphs_W);
N = N1(3);
edgeFreqPear = zeros(N1(1));
nodeFreqPear = zeros(N1(1),1);

for i = 1:N

    edgeFreqPear = edgeFreqPear + GraphsPear.Graphs_W(:,:,i);
    nodeFreqPear = nodeFreqPear + sum(GraphsPear.Graphs_W(:,:,i),2);

end
%{
figure()
subplot(2,2,1);
image(edgeFreqSim);
colorbar;
title('Similarity');

subplot(2,2,2);
image(edgeFreqSpar);
colorbar;
title('Sparsity');

subplot(2,2,3);
image(edgeFreqPear);
colorbar;
title('Pearson');
%}

%% Plotting
figure()
subplot(4,1,1);
stem(nodeFreqSim,'r',LineWidth=1.5);
[ma,a] = max(nodeFreqSim);
hold on
scatter(a,ma,60,'o','filled','r');
hold off
xlabel('Nodes');
ylabel('Frequency');
title('Similarity');

subplot(4,1,2);
stem(real(nodeFreqSpar),'black',LineWidth=1.5);
[ma,a] = max(real(nodeFreqSpar));
hold on
scatter(a,ma,60,'o','filled','black');
hold off
xlabel('Nodes');
ylabel('Frequency');
title('Sparsity');

subplot(4,1,3);
stem(nodeFreqPear,'b',LineWidth=1.5);
[ma,a] = max(nodeFreqPear);
hold on
scatter(a,ma,60,'o','filled','b');
hold off
xlabel('Nodes');
ylabel('Frequency');
title('Pearson');

subplot(4,1,4);
stem(real(nodeFreqSmooth),'b',LineWidth=1.5);
[ma,a] = max(real(nodeFreqSmooth));
hold on
scatter(a,ma,60,'o','filled','b');
hold off
xlabel('Nodes');
ylabel('Frequency');
title('Smoothness');