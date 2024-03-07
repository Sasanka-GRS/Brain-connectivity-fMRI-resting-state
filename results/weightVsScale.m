%% Extract Data

Sim303 = load("..\graph_learning\graph_data\303_graph_SimWindowWeighted.mat").Graphs_W;
Pear303 = load("..\graph_learning\graph_data\303_graph_PearWindowWeighted.mat").Graphs_W;
Spar303 = load("..\graph_learning\graph_data\303_graph_SparWindowWeighted.mat").Graphs_W;
Smooth303 = load("..\graph_learning\graph_data\303_graph_SmoothWindowWeighted.mat").Graphs_W;

Sim378 = load("..\graph_learning\graph_data\378_graph_SimWindowWeighted.mat").Graphs_W;
Pear378 = load("..\graph_learning\graph_data\378_graph_PearWindowWeighted.mat").Graphs_W;
Spar378 = load("..\graph_learning\graph_data\378_graph_SparWindowWeighted.mat").Graphs_W;
Smooth378 = load("..\graph_learning\graph_data\378_graph_SmoothWindowWeighted.mat").Graphs_W;

node = load("..\extract_data\nodeLabels.mat").numbers;
scale = load("..\extract_data\rating.mat").scale;

%% Window scale

scaleD = scale(1:2:end);
L = length(scaleD);
Num = 8; % Window Length

scaleW = zeros(L-Num+1,1);

for i = 1:L-Num+1
    window = scaleD(i:i+Num-1);
    average = sum(window,1)/Num;
    scaleW(i) = average;
end

%% Important Regions

R1 = "insula_L";
R2 = "insula_R";

N = size(Sim378);
N = N(3);

time = (1:2:2*N)';

%% Calculate Indices

indexR1 = find(node==R1);
indexR2 = find(node==R2);

%% Similarity 

Sim303Signal = squeeze(Sim303(indexR1,indexR2,:));
Sim378Signal = squeeze(Sim378(indexR1,indexR2,:));

figure()
subplot(2,1,1)
scatter(scaleW,Sim303Signal);
title('Similarity 303 vs scale');
subplot(2,1,2)
scatter(scaleW,Sim378Signal);
title('Similarity 378 vs scale');

%% Sparsity

Spar303Signal = real(squeeze(Spar303(indexR1,indexR2,:)));
Spar378Signal = real(squeeze(Spar378(indexR1,indexR2,:)));

figure()
subplot(2,1,1)
scatter(scaleW,Spar303Signal);
title('Sparsity 303 vs scale');
subplot(2,1,2)
scatter(scaleW,Spar378Signal);
title('Sparsity 378 vs scale');

%% Pearson 

Pear303Signal = squeeze(Pear303(indexR1,indexR2,:));
Pear378Signal = squeeze(Pear378(indexR1,indexR2,:));

figure()
subplot(2,1,1)
scatter(scaleW,Pear303Signal);
title('Pearson 303 vs scale');
subplot(2,1,2)
scatter(scaleW,Pear378Signal);
title('Pearson 378 vs scale');

%% Smoothness

Smooth303Signal = real(squeeze(Smooth303(indexR1,indexR2,:)));
Smooth378Signal = real(squeeze(Smooth378(indexR1,indexR2,:)));

figure()
subplot(2,1,1)
scatter(scaleW,Smooth303Signal);
title('Smoothness 303 vs scale');
subplot(2,1,2)
scatter(scaleW,Smooth378Signal);
title('Smoothness 378 vs scale');