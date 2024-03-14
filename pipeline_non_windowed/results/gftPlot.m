clc
clear

%% Add dependencies

addpath('.\functions\')

%% Load data

% Layout
Layout = load('../extract_data/nodeLayout.mat').locs;

% Labels
Labels = load('../extract_data/nodeLabels.mat').numbers;

% Subjects
subjects = ["303","378","386","797","820","998","1092","1093","1171","1271","1352","1511","1603","1629"];
topSubjects = ["998","1352","1511","1603","1629"];

GraphTemp = load('..\graph_learning\graph_data\303_graph_SimWindowWeighted.mat').Graphs_W;
S = size(GraphTemp);

% Indices for empathy high and low
idxLow = 74;
idxHigh = 243;

% Graphs
Graphs_Spar_LOW = zeros(S(1),S(2),length(subjects));
Graphs_Spar_HIGH = zeros(S(1),S(2),length(subjects));

for s = 1:length(subjects)
    s1 = "..\graph_learning\graph_data\";
    s2 = "_graph_SparWindowWeighted.mat";
    sub = s1 + subjects(s) + s2;

    temp = load(sub).Graphs_W;
    Graphs_Spar_LOW(:,:,s) = temp(:,:,idxLow);
    Graphs_Spar_HIGH(:,:,s) = temp(:,:,idxHigh);
end

gft303 = load('.\gft\303_GFTFiltered.mat');
S = size(gft303.Spar.LPF);

% Size parameters
N = S(1);
K = 5; % Number of top edges to highlight

% Window size
Num = 8;

% The graph signal to be plotted
gft_LPF_LOW = zeros(S(1),length(subjects));
gft_BPF_LOW = zeros(S(1),length(subjects));
gft_HPF_LOW = zeros(S(1),length(subjects));
gft_LPF_HIGH = zeros(S(1),length(subjects));
gft_BPF_HIGH = zeros(S(1),length(subjects));
gft_HPF_HIGH = zeros(S(1),length(subjects));

for s = 1:length(subjects)
    s1 = ".\gft\";
    s2 = "_GFTFiltered.mat";
    sub = s1 + subjects(s) + s2;

    temp = load(sub).Spar.LPF;
    gft_LPF_LOW(:,s) = thres_signal(temp(:,idxLow+floor(Num/2)),K);
    temp = load(sub).Spar.BPF;
    gft_BPF_LOW(:,s) = thres_signal(temp(:,idxLow+floor(Num/2)),K);
    temp = load(sub).Spar.HPF;
    gft_HPF_LOW(:,s) = thres_signal(temp(:,idxLow+floor(Num/2)),K);

    temp = load(sub).Spar.LPF;
    gft_LPF_HIGH(:,s) = thres_signal(temp(:,idxHigh+floor(Num/2)),K);
    temp = load(sub).Spar.BPF;
    gft_BPF_HIGH(:,s) = thres_signal(temp(:,idxHigh+floor(Num/2)),K);
    temp = load(sub).Spar.HPF;
    gft_HPF_HIGH(:,s) = thres_signal(temp(:,idxHigh+floor(Num/2)),K);
end

%% Thesholding

Graphs_Thresholded_LOW = zeros(size(Graphs_Spar_LOW));
Graphs_Top_LOW = zeros(size(Graphs_Spar_LOW));
Graphs_Thresholded_HIGH = zeros(size(Graphs_Spar_HIGH));
Graphs_Top_HIGH = zeros(size(Graphs_Spar_HIGH));

for s = 1:length(subjects)
    A = Graphs_Spar_LOW(:,:,s);
    [W,topLOW] = thres1(A,N,K);
    W = normAdj(W);

    Graphs_Thresholded_LOW(:,:,s) = W;
    Graphs_Top_LOW(:,:,s) = topLOW;

    A = Graphs_Spar_HIGH(:,:,s);
    [W,topHIGH] = thres1(A,N,K);
    W = normAdj(W);

    Graphs_Thresholded_HIGH(:,:,s) = W;
    Graphs_Top_HIGH(:,:,s) = topHIGH;
end

%% Generate metrics


%% Plot for 303

figure()
subplot(2,3,1)
plotting_signal(Layout,Graphs_Thresholded_LOW(:,:,1),Graphs_Top_LOW(:,:,1),Labels,gft_LPF_LOW(:,1));
title('LPF Empathy Low')
subplot(2,3,2)
plotting_signal(Layout,Graphs_Thresholded_LOW(:,:,1),Graphs_Top_LOW(:,:,1),Labels,gft_BPF_LOW(:,1));
title('BPF Empathy Low')
subplot(2,3,3)
plotting_signal(Layout,Graphs_Thresholded_LOW(:,:,1),Graphs_Top_LOW(:,:,1),Labels,gft_HPF_LOW(:,1));
title('HPF Empathy Low')
subplot(2,3,4)
plotting_signal(Layout,Graphs_Thresholded_HIGH(:,:,1),Graphs_Top_HIGH(:,:,1),Labels,gft_LPF_HIGH(:,1));
title('LPF Empathy High')
subplot(2,3,5)
plotting_signal(Layout,Graphs_Thresholded_HIGH(:,:,1),Graphs_Top_HIGH(:,:,1),Labels,gft_BPF_HIGH(:,1));
title('BPF Empathy High')
subplot(2,3,6)
plotting_signal(Layout,Graphs_Thresholded_HIGH(:,:,1),Graphs_Top_HIGH(:,:,1),Labels,gft_HPF_HIGH(:,1));
title('HPF Empathy High')
sgtitle('Sparsity 998')