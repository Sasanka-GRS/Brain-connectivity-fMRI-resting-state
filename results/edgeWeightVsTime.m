clc
clear

%% Add dependencies

addpath('.\functions\');

%% Set parameters

% Subjects
subjects = ["303","378","386","797","820","998","1092","1093","1171","1271","1352","1511","1603","1629"];
topSubjects = ["998","1352","1511","1603","1629"];
S = length(subjects);

% Graph sizes
GraphTemp = load('..\graph_learning\graph_data\303_graph_SimWindowWeighted.mat').Graphs_W;
Sz = size(GraphTemp);
N = Sz(1);
T = Sz(3);

% Number of edges to preserve
K = 5;

% Indices for empathy high and low
idxLow = 74;
idxHigh = 243;

%% Load data

% Labels
Labels = load('../extract_data/nodeLabels.mat').names;

% Graphs
Graphs = zeros(N,N,T,S);

for s = 1:S
    s1 = "..\normalize_graphs\normalized_graphs\";
    s2 = "_normalizedGraphs.mat";
    sub = s1 + subjects(s) + s2;

    temp = load(sub).graphOut.Spar;
    Graphs(:,:,:,s) = temp.\sum(sum(temp));
end

% Emotion scale
scale = load("..\extract_data\rating.mat").scale;

%% Window scale

scaleD = scale(1:2:end);
L = length(scaleD);
Num = 8; % Window Length

scaleW = zeros(L-Num+1,1);

for i = 1:L-Num+1
    window = scaleD(i:i+Num-1);
    ward = sum(window,1)/Num;
    scaleW(i) = ward;
end

%% Run loop for all edges

distances = zeros(N,N,S);
for i = 1:N
    for j = i+1:N
        for s = 1:S
            edgeSeries = squeeze(Graphs(i,j,:,s));
            distances(i,j,s) = max(abs(xcorr(edgeSeries,scaleW,'coeff')));
        end
    end
end

%% Average over all subjects and top subjects

distances_all = squeeze(sum(distances,3));
distances_top = zeros(N,N);

for t = 1:length(topSubjects)
    idx = find(subjects==topSubjects(t));
    distances_top = distances_top + squeeze(distances(:,:,idx));
end

%% Threshold for best edges

best_all = thres(distances_all,K);
best_top = thres(distances_top,K);

locs_all = find(best_all);
locs_top = find(best_top);

fprintf('\nAveraging all subjects\n');

for i = 1:length(locs_top)
    x = rem(locs_all(i),N);
    y = ceil(locs_all(i)/N);
    fprintf('%s <=> %s\n',Labels(x),Labels(y));
end

fprintf('\nAveraging top 5 subjects\n');

for i = 1:length(locs_top)
    x = rem(locs_top(i),N);
    y = ceil(locs_top(i)/N);
    fprintf('%s <=> %s\n',Labels(x),Labels(y));
end