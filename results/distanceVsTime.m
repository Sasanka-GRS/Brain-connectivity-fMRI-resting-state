clc
clear

%% Set parameters

subjects = ["303","378","386","820","1092","1093","1171","1352","1511","1629"];
tempGraphs = load("..\normalize_graphs\normalized_graphs\303_normalizedGraphs.mat").graphOut.Sim;
methods = ["Sim","Pear","Smooth","Spar"];

sz = size(tempGraphs);
N = sz(1);
T = sz(3);
S = length(subjects);

%% Load data for resting state

normalizedGraphsRS.Sim = zeros(N,N,S);
normalizedGraphsRS.Pear = zeros(N,N,S);
normalizedGraphsRS.Smooth = zeros(N,N,S);
normalizedGraphsRS.Spar = zeros(N,N,S);

originalGraphsRS.Sim = zeros(N,N,S);
originalGraphsRS.Pear = zeros(N,N,S);
originalGraphsRS.Smooth = zeros(N,N,S);
originalGraphsRS.Spar = zeros(N,N,S);

for s = 1:S
    subject = subjects(s);

    s1 = '..\normalize_graphs\normalized_graphs\';
    s2 = '_normalizedGraphs_RS.mat';
    sub = s1 + subject + s2;

    data = load(sub);

    for m = 1:4
        method = methods(m);
        normalizedGraphsRS.(method)(:,:,s) = data.graphOut.(method);
    end

    for m = 1:4
        method = methods(m);
        s1 = '..\graph_learning\graph_data\';
        s2 = '_graph_';
        s3 = 'WindowWeighted_RS.mat';
        sub = s1 + subject + s2 + method + s3;

        data = load(sub);

        originalGraphsRS.(method)(:,:,s) = data.Graphs_W;
    end
end

%% Load data for M1

normalizedGraphsM1.Sim = zeros(N,N,T,S);
normalizedGraphsM1.Pear = zeros(N,N,T,S);
normalizedGraphsM1.Smooth = zeros(N,N,T,S);
normalizedGraphsM1.Spar = zeros(N,N,T,S);

originalGraphsM1.Sim = zeros(N,N,T,S);
originalGraphsM1.Pear = zeros(N,N,T,S);
originalGraphsM1.Smooth = zeros(N,N,T,S);
originalGraphsM1.Spar = zeros(N,N,T,S);

for s = 1:S
    subject = subjects(s);

    s1 = '..\normalize_graphs\normalized_graphs\';
    s2 = '_normalizedGraphs.mat';
    sub = s1 + subject + s2;

    data = load(sub);

    for m = 1:4
        method = methods(m);
        normalizedGraphsM1.(method)(:,:,:,s) = data.graphOut.(method);
    end

    for m = 1:4
        method = methods(m);
        s1 = '..\graph_learning\graph_data\';
        s2 = '_graph_';
        s3 = 'WindowWeighted.mat';
        sub = s1 + subject + s2 + method + s3;

        data = load(sub);

        originalGraphsM1.(method)(:,:,:,s) = data.Graphs_W;
    end
end

%% Load the scale and window it

scale = load("..\extract_data\rating.mat").scale;
scaleD = scale(1:2:end);
L = length(scaleD);
Num = 8; % Window Length

scaleW = zeros(L-Num+1,1);

for i = 1:L-Num+1
    window = scaleD(i:i+Num-1);
    ward = sum(window,1)/Num;
    scaleW(i) = ward;
end

%% Find respective distances

distancesNormalized.Sim = zeros(T,S);
distancesNormalized.Pear = zeros(T,S);
distancesNormalized.Smooth = zeros(T,S);
distancesNormalized.Spar = zeros(T,S);

distancesNormalizedAvg.Sim = zeros(T,1);
distancesNormalizedAvg.Pear = zeros(T,1);
distancesNormalizedAvg.Smooth = zeros(T,1);
distancesNormalizedAvg.Spar = zeros(T,1);

distancesOriginal.Sim = zeros(T,S);
distancesOriginal.Pear = zeros(T,S);
distancesOriginal.Smooth = zeros(T,S);
distancesOriginal.Spar = zeros(T,S);

distancesOriginalAvg.Sim = zeros(T,1);
distancesOriginalAvg.Pear = zeros(T,1);
distancesOriginalAvg.Smooth = zeros(T,1);
distancesOriginalAvg.Spar = zeros(T,1);

for s = 1:S
    subject = subjects(s);
    
    for m = 1:4
        method = methods(m);
        
        for t = 1:T
            distancesNormalized.(method)(t,s) = norm(normalizedGraphsM1.(method)(:,:,t,s) - normalizedGraphsRS.(method)(:,:,s),'fro');
            distancesOriginal.(method)(t,s) = norm(originalGraphsM1.(method)(:,:,t,s) - originalGraphsRS.(method)(:,:,s),'fro');
        end
        
        distancesNormalizedAvg.(method) = mean(distancesNormalized.(method),2);
        distancesOriginalAvg.(method) = mean(distancesOriginal.(method),2);
    end
end

%% Plotting

fig = figure();
for m = 1:4
    method = methods(m);

    subplot(4,1,m)
    signal = distancesOriginalAvg.(method);
    plot(1:2:2*length(scaleW),-(signal-sum(signal)/length(signal))/(sqrt(var(signal))),LineWidth=2.0)
    xlabel('Time (s)','FontSize',15,'FontWeight','bold')
    signal = scaleW;
    hold on
    plot(1:2:2*length(scaleW),(signal-sum(signal)/length(signal))/(sqrt(var(signal))),LineWidth=2.0)
    hold off
    title(method)
    %legend('Distances','Emotion contagion scale','FontSize',12,'FontWeight','bold')
end
sgtitle('Original')
fontsize(fig,15,"points")

fig = figure();
for m = 1:4
    method = methods(m);

    subplot(4,1,m)
    signal = distancesNormalizedAvg.(method);
    plot(1:2:2*length(scaleW),-(signal-sum(signal)/length(signal))/(sqrt(var(signal))),LineWidth=2.0)
    xlabel('Time (s)','FontSize',15,'FontWeight','bold')
    signal = scaleW;
    hold on
    plot(1:2:2*length(scaleW),(signal-sum(signal)/length(signal))/(sqrt(var(signal))),LineWidth=2.0)
    hold off
    title(method)
    %legend('Distances','Emotion contagion scale','FontSize',12,'FontWeight','bold')
end
sgtitle('Normalized')
fontsize(fig,15,"points")