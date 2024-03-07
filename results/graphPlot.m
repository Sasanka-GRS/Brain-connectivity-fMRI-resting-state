clc
clear

%% Add dependencies
addpath(".\functions\");

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

N = S(1);
K = 5; % Number of edges to preserve

% Indices for empathy high and low
idxLow = 74;
idxHigh = 243;

% Graphs
Graphs_Spar_LOW = zeros(S(1),S(2),length(subjects));
Graphs_Spar_HIGH = zeros(S(1),S(2),length(subjects));
Graphs_Spar_AVG = zeros(S(1),S(2),length(subjects));

for s = 1:length(subjects)
    s1 = "..\graph_learning\graph_data\";
    s2 = "_graph_SparWindowWeighted.mat";
    sub = s1 + subjects(s) + s2;

    temp = load(sub).Graphs_W;
    Graphs_Spar_LOW(:,:,s) = temp(:,:,idxLow)/sum(sum(temp(:,:,idxLow)));
    Graphs_Spar_HIGH(:,:,s) = temp(:,:,idxHigh)/sum(sum(temp(:,:,idxHigh)));
    Graphs_Spar_AVG(:,:,s) = sum(temp.\sum(sum(temp)),3);
end

%% Thesholding

Graphs_Thresholded_LOW = zeros(size(Graphs_Spar_LOW));
Graphs_Top_LOW = zeros(size(Graphs_Spar_LOW));
Graphs_Thresholded_HIGH = zeros(size(Graphs_Spar_HIGH));
Graphs_Top_HIGH = zeros(size(Graphs_Spar_HIGH));
Graphs_Thresholded_AVG = zeros(size(Graphs_Spar_AVG));
Graphs_Top_AVG = zeros(size(Graphs_Spar_AVG));

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

    A = Graphs_Spar_AVG(:,:,s);
    [W,topAVG] = thres1(A,N,K);
    W = normAdj(W);

    Graphs_Thresholded_AVG(:,:,s) = W;
    Graphs_Top_AVG(:,:,s) = topAVG;
end

%% Generate combinations

allSubjectsSumAllTime = sum(Graphs_Spar_AVG,3);
allSubjectsLOW = sum(Graphs_Spar_LOW,3);
allSubjectsHIGH = sum(Graphs_Spar_HIGH,3);

A = allSubjectsSumAllTime;
[W,topAllTime] = thres1(A,N,K);
W = normAdj(W);
W_allsub_alltime = W;

A = allSubjectsLOW;
[W,topLOW] = thres1(A,N,K);
W = normAdj(W);
W_allsub_LOW = W;

A = allSubjectsHIGH;
[W,topHIGH] = thres1(A,N,K);
W = normAdj(W);
W_allsub_HIGH = W;

%% Plotting

figure()

subplot(1,3,1)
plotting(Layout(:,1:2),W_allsub_alltime,topAllTime,Labels);
title('Average of all time','FontSize',25);
set(gca,'XColor', 'none','YColor','none')
subplot(1,3,2)
plotting(Layout(:,1:2),W_allsub_LOW,topLOW,Labels);
title('Empathy LOW','FontSize',25);
set(gca,'XColor', 'none','YColor','none')
subplot(1,3,3)
plotting(Layout(:,1:2),W_allsub_HIGH,topHIGH,Labels);
title('Empathy HIGH','FontSize',25);
set(gca,'XColor', 'none','YColor','none')
tightfig

sgtitle('Sparsity','FontSize',25);