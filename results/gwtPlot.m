clc
clear

%% Load data

% Layout
Layout = load('nodeLayout.mat').locs;

% Labels
Labels = load('nodeLabels.mat').numbers;

% Graphs to be plotted
Graph303Sim = load('..\..\graph_learning\graph_data\303_graph_SimWindowWeighted.mat').Graphs_W;
Graph303Spar = load('..\..\graph_learning\graph_data\303_graph_SparWindowWeighted.mat').Graphs_W;
Graph303Pear = load('..\..\graph_learning\graph_data\303_graph_PearWindowWeighted.mat').Graphs_W;
Graph303Smooth = load('..\..\graph_learning\graph_data\303_graph_SmoothWindowWeighted.mat').Graphs_W;

% The graph signal to be plotted
gft303 = load('.\gwt\303_SGWTFiltered.mat');

% The 3 bands of interest
Sim303 = gft303.Sim;
Spar303 = gft303.Spar;
Pear303 = gft303.Pear;
Smooth303 = gft303.Smooth;

wlpSim = Sim303.w_lp;
w1Sim = Sim303.w_1;
w2Sim = Sim303.w_2;
w3Sim = Sim303.w_3;
w4Sim = Sim303.w_4;

wlpSpar = Spar303.w_lp;
w1Spar = Spar303.w_1;
w2Spar = Spar303.w_2;
w3Spar = Spar303.w_3;
w4Spar = Spar303.w_4;

wlpPear = Pear303.w_lp;
w1Pear = Pear303.w_1;
w2Pear = Pear303.w_2;
w3Pear = Pear303.w_3;
w4Pear = Pear303.w_4;

wlpSmooth = Smooth303.w_lp;
w1Smooth = Smooth303.w_1;
w2Smooth = Smooth303.w_2;
w3Smooth = Smooth303.w_3;
w4Smooth = Smooth303.w_4;

% Size parameters
S = size(wlpSim);
N = S(1);
T = S(2);

% Indices for empathy high and low
idxLow = 73;
idxHigh = 242;

%% Thesholding

% Similarity
A = Graph303Sim(:,:,idxLow);
[W,topSimLow] = thres1(A,N,3);
W = normAdj(W);

W_SimLow = W;

A = Graph303Sim(:,:,idxHigh);
[W,topSimHigh] = thres1(A,N,3);
W = normAdj(W);

W_SimHigh = W;

% Sparsity
A = Graph303Spar(:,:,idxLow);
[W,topSparLow] = thres1(A,N,3);
W = normAdj(W);

W_SparLow = W;

A = Graph303Spar(:,:,idxHigh);
[W,topSparHigh] = thres1(A,N,3);
W = normAdj(W);

W_SparHigh = W;

% Pearson
A = Graph303Pear(:,:,idxLow);
[W,topPearLow] = thres1(A,N,3);
W = normAdj(W);

W_PearLow = W;

A = Graph303Pear(:,:,idxHigh);
[W,topPearHigh] = thres1(A,N,3);
W = normAdj(W);

W_PearHigh = W;

% Smoothness
A = Graph303Smooth(:,:,idxLow);
[W,topSmoothLow] = thres1(A,N,3);
W = normAdj(W);

W_SmoothLow = W;

A = Graph303Smooth(:,:,idxHigh);
[W,topSmoothHigh] = thres1(A,N,3);
W = normAdj(W);

W_SmoothHigh = W;

%% Extracting signal

% Similarity
wlpSimLow = wlpSim(:,idxLow);
w1SimLow = w1Sim(:,idxLow);
w2SimLow = w2Sim(:,idxLow);
w3SimLow = w3Sim(:,idxLow);
w4SimLow = w4Sim(:,idxLow);
wlpSimHigh = wlpSim(:,idxHigh);
w1SimHigh = w1Sim(:,idxHigh);
w2SimHigh = w2Sim(:,idxHigh);
w3SimHigh = w3Sim(:,idxHigh);
w4SimHigh = w4Sim(:,idxHigh);

% Sparsity
wlpSparLow = wlpSpar(:,idxLow);
w1SparLow = w1Spar(:,idxLow);
w2SparLow = w2Spar(:,idxLow);
w3SparLow = w3Spar(:,idxLow);
w4SparLow = w4Spar(:,idxLow);
wlpSparHigh = wlpSpar(:,idxHigh);
w1SparHigh = w1Spar(:,idxHigh);
w2SparHigh = w2Spar(:,idxHigh);
w3SparHigh = w3Spar(:,idxHigh);
w4SparHigh = w4Spar(:,idxHigh);

% Pearson
wlpPearLow = wlpPear(:,idxLow);
w1PearLow = w1Pear(:,idxLow);
w2PearLow = w2Pear(:,idxLow);
w3PearLow = w3Pear(:,idxLow);
w4PearLow = w4Pear(:,idxLow);
wlpPearHigh = wlpPear(:,idxHigh);
w1PearHigh = w1Pear(:,idxHigh);
w2PearHigh = w2Pear(:,idxHigh);
w3PearHigh = w3Pear(:,idxHigh);
w4PearHigh = w4Pear(:,idxHigh);

% Smoothness
wlpSmoothLow = wlpSmooth(:,idxLow);
w1SmoothLow = w1Smooth(:,idxLow);
w2SmoothLow = w2Smooth(:,idxLow);
w3SmoothLow = w3Smooth(:,idxLow);
w4SmoothLow = w4Smooth(:,idxLow);
wlpSmoothHigh = wlpSmooth(:,idxHigh);
w1SmoothHigh = w1Smooth(:,idxHigh);
w2SmoothHigh = w2Smooth(:,idxHigh);
w3SmoothHigh = w3Smooth(:,idxHigh);
w4SmoothHigh = w4Smooth(:,idxHigh);

%% Plotting

figure()
subplot(2,5,1)
plotting_signal(Layout,W_SparLow,topSparLow,Labels,wlpSparLow);
title('Low Pass Empathy Low')
subplot(2,5,2)
plotting_signal(Layout,W_SparLow,topSparLow,Labels,w1SparLow);
title('Scale 1 Empathy Low')
subplot(2,5,3)
plotting_signal(Layout,W_SparLow,topSparLow,Labels,w2SparLow);
title('Scale 2 Empathy Low')
subplot(2,5,4)
plotting_signal(Layout,W_SparLow,topSparLow,Labels,w3SparLow);
title('Scale 4 Empathy Low')
subplot(2,5,5)
plotting_signal(Layout,W_SparLow,topSparLow,Labels,w4SparLow);
title('Scale 4 Empathy Low')
subplot(2,5,6)
plotting_signal(Layout,W_SparHigh,topSparHigh,Labels,wlpSparHigh);
title('High Pass Empathy High')
subplot(2,5,7)
plotting_signal(Layout,W_SparHigh,topSparHigh,Labels,w1SparHigh);
title('Scale 1 Empathy High')
subplot(2,5,8)
plotting_signal(Layout,W_SparHigh,topSparHigh,Labels,w2SparHigh);
title('Scale 2 Empathy High')
subplot(2,5,9)
plotting_signal(Layout,W_SparHigh,topSparHigh,Labels,w3SparHigh);
title('Scale 4 Empathy High')
subplot(2,5,10)
plotting_signal(Layout,W_SparHigh,topSparHigh,Labels,w4SparHigh);
title('Scale 4 Empathy High')