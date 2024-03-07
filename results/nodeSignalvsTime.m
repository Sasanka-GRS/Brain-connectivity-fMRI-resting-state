clc
clear

%% Add dependencies

addpath('.\functions\');

%% Set parameters

% Subjects
subjects = ["303","378","386","797","820","998","1092","1093","1171","1271","1352","1511","1603","1629"];
topSubjects = ["998","1352","1511","1603","1629"];
S = length(subjects);

% Data sizes
DataTemp = load('..\combination\combined_data\303_data_combined.mat').data;
Sz = size(DataTemp);
N = Sz(2);
T = Sz(1);

% Number of nodes to preserve
K = 5;

% Indices for empathy high and low
idxLow = 74;
idxHigh = 243;

% Window Length
Num = 8;

%% Load data

% Labels
Labels = load('../extract_data/nodeLabels.mat').names;

% Graphs
Datas = zeros(T,N,S);

for s = 1:S
    s1 = "..\combination\combined_data\";
    s2 = "_data_combined.mat";
    sub = s1 + subjects(s) + s2;

    temp = load(sub).data;
    Datas(:,:,s) = temp.\sum(temp);
end

% Emotion scale
scale = load("..\extract_data\rating.mat").scale;

%% Window scale

scaleD = scale(1:2:end);
L = length(scaleD);

scaleW = zeros(L-Num+1,1);

for i = 1:L-Num+1
    window = scaleD(i:i+Num-1);
    ward = sum(window,1)/Num;
    scaleW(i) = ward;
end

%% Window data

windowedDatas = zeros(T-Num+1,N,S);

for s = 1:S
    for i = 1:N
        signal = Datas(:,i,s);

        for j = 1:T-Num+1
            window = signal(j:j+Num-1);
            ward = sum(window,1)/Num;
            windowedDatas(j,i,s) = ward;
        end
    end
end

%% Run loop for all regions

distances = zeros(N,S);
for i = 1:N
    for s = 1:S
        nodeSeries = squeeze(windowedDatas(:,i,s));
        distances(i,s) = max(abs(xcorr(nodeSeries,scaleW,'coeff')));
    end
end

%% Average over all subjects and top subjects

distances_all = squeeze(sum(distances,2));
distances_top = zeros(N,1);

for t = 1:length(topSubjects)
    idx = find(subjects==topSubjects(t));
    distances_top = distances_top + squeeze(distances(:,idx));
end

%% Threshold for best edges

[best_all,indices_all] = maxk(distances_all,K);
[best_top,indices_top] = maxk(distances_top,K);

fprintf('\nAveraging all subjects\n');

for i = 1:K
    fprintf('%s\n',Labels(indices_all(i)));
end

fprintf('\nAveraging top 5 subjects\n');

for i = 1:K
    fprintf('%s\n',Labels(indices_top(i)));
end