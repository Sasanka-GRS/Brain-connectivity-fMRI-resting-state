clc
clear

%% Set parameters

addpath('.\functions\');

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

normalizedThresRS.Sim = zeros(N,N,S);
normalizedThresRS.Pear = zeros(N,N,S);
normalizedThresRS.Smooth = zeros(N,N,S);
normalizedThresRS.Spar = zeros(N,N,S);

originalGraphsRS.Sim = zeros(N,N,S);
originalGraphsRS.Pear = zeros(N,N,S);
originalGraphsRS.Smooth = zeros(N,N,S);
originalGraphsRS.Spar = zeros(N,N,S);

originalThresRS.Sim = zeros(N,N,S);
originalThresRS.Pear = zeros(N,N,S);
originalThresRS.Smooth = zeros(N,N,S);
originalThresRS.Spar = zeros(N,N,S);

for s = 1:S
    subject = subjects(s);

    s1 = '..\normalize_graphs\normalized_graphs\';
    s2 = '_normalizedGraphs_RS.mat';
    sub = s1 + subject + s2;

    data = load(sub);

    for m = 1:4
        method = methods(m);
        normalizedGraphsRS.(method)(:,:,s) = data.graphOut.(method);
        [W,~] = thres1(data.graphOut.(method),N,5);
        normalizedThresRS.(method)(:,:,s) = W;
    end

    for m = 1:4
        method = methods(m);
        s1 = '..\graph_learning\graph_data\';
        s2 = '_graph_';
        s3 = 'WindowWeighted_RS.mat';
        sub = s1 + subject + s2 + method + s3;

        data = load(sub);

        originalGraphsRS.(method)(:,:,s) = data.Graphs_W;
        [W,~] = thres1(data.Graphs_W,N,5);
        originalThresRS.(method)(:,:,s) = W;
    end
end

%% Load data for M1

normalizedGraphsM1.Sim = zeros(N,N,T,S);
normalizedGraphsM1.Pear = zeros(N,N,T,S);
normalizedGraphsM1.Smooth = zeros(N,N,T,S);
normalizedGraphsM1.Spar = zeros(N,N,T,S);

normalizedThresM1.Sim = zeros(N,N,T,S);
normalizedThresM1.Pear = zeros(N,N,T,S);
normalizedThresM1.Smooth = zeros(N,N,T,S);
normalizedThresM1.Spar = zeros(N,N,T,S);

originalGraphsM1.Sim = zeros(N,N,T,S);
originalGraphsM1.Pear = zeros(N,N,T,S);
originalGraphsM1.Smooth = zeros(N,N,T,S);
originalGraphsM1.Spar = zeros(N,N,T,S);

originalThresM1.Sim = zeros(N,N,T,S);
originalThresM1.Pear = zeros(N,N,T,S);
originalThresM1.Smooth = zeros(N,N,T,S);
originalThresM1.Spar = zeros(N,N,T,S);

for s = 1:S
    subject = subjects(s);

    s1 = '..\normalize_graphs\normalized_graphs\';
    s2 = '_normalizedGraphs.mat';
    sub = s1 + subject + s2;

    data = load(sub);

    for m = 1:4
        method = methods(m);
        normalizedGraphsM1.(method)(:,:,:,s) = data.graphOut.(method);
        x = data.graphOut.(method);
        sized = size(x);
        for i = 1:sized(3)
            [W,~] = thres1(x(:,:,i),5,5);
            normalizedThresM1.(method)(:,:,i,s) = W;
        end
    end

    for m = 1:4
        method = methods(m);
        s1 = '..\graph_learning\graph_data\';
        s2 = '_graph_';
        s3 = 'WindowWeighted.mat';
        sub = s1 + subject + s2 + method + s3;

        data = load(sub);

        originalGraphsM1.(method)(:,:,:,s) = data.Graphs_W;
        
        x = data.Graphs_W;
        sized = size(x);
        for i = 1:sized(3)
            [W,~] = thres1(x(:,:,i),5,5);
            originalThresM1.(method)(:,:,i,s) = W;
        end
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

distancesThresAND.Sim = zeros(T,S);
distancesThresAND.Pear = zeros(T,S);
distancesThresAND.Smooth = zeros(T,S);
distancesThresAND.Spar = zeros(T,S);

distancesThresANDAvg.Sim = zeros(T,1);
distancesThresANDAvg.Pear = zeros(T,1);
distancesThresANDAvg.Smooth = zeros(T,1);
distancesThresANDAvg.Spar = zeros(T,1);

for s = 1:S
    subject = subjects(s);
    
    for m = 1:4
        method = methods(m);
        
        for t = 1:T
            distancesNormalized.(method)(t,s) = norm(normalizedThresM1.(method)(:,:,t,s) - normalizedThresRS.(method)(:,:,s),'fro');
            distancesOriginal.(method)(t,s) = norm(originalThresM1.(method)(:,:,t,s) - originalThresRS.(method)(:,:,s),'fro');
            distancesThresAND.(method)(t,s) = nnz(originalThresM1.(method)(:,:,t,s) .* originalThresRS.(method)(:,:,s))/N;
        end
        
        distancesNormalizedAvg.(method) = mean(distancesNormalized.(method),2);
        distancesOriginalAvg.(method) = mean(distancesOriginal.(method),2);
        distancesThresANDAvg.(method) = mean(distancesThresAND.(method),2);
    end
end

%% Plotting

values = zeros(4,2);

fig = figure();
for m = 1:4
    method = methods(m);

    subplot(4,1,m)
    signal = distancesThresANDAvg.(method);
    plot(1:2:2*length(scaleW),-(signal-sum(signal)/length(signal))/(sqrt(var(signal))),LineWidth=2.0)
    xlabel('Time (s)','FontSize',15,'FontWeight','bold')
    signal = scaleW;
    hold on
    plot(1:2:2*length(scaleW),(signal-sum(signal)/length(signal))/(sqrt(var(signal))),LineWidth=2.0)
    hold off
    title(method)

    %values(m,1) = (sum(distancesThresANDAvg.(method).*scaleW))/(norm(distancesThresANDAvg.(method),2)*norm(scaleW,2));
    %legend('Distances','Emotion contagion scale','FontSize',12,'FontWeight','bold')
end
sgtitle('Original')
fontsize(fig,15,"points")
tightfig
%print('distance_OriginalGraphs','-dpdf','-bestfit')
%{
fig = figure();
for m = 1:4
    method = methods(m);

    subplot(4,1,m)
    signal = distancesNormalizedAvg.(method);
    plot(1:2:2*length(scaleW),(signal-sum(signal)/length(signal))/(sqrt(var(signal))),LineWidth=2.0)
    xlabel('Time (s)','FontSize',15,'FontWeight','bold')
    signal = scaleW;
    hold on
    plot(1:2:2*length(scaleW),(signal-sum(signal)/length(signal))/(sqrt(var(signal))),LineWidth=2.0)
    hold off
    title(method)

    values(m,2) = (sum(distancesNormalizedAvg.(method).*scaleW))/(norm(distancesNormalizedAvg.(method),2)*norm(scaleW,2));
    %legend('Distances','Emotion contagion scale','FontSize',12,'FontWeight','bold')
end
sgtitle('Normalized')
fontsize(fig,15,"points")
tightfig
print('distance_NormalizedGraphs','-dpdf','-bestfit')
%}

%% Moving Average

window_size = 16;
kernel = ones(1, window_size) / window_size;

figure()
for m = 1:4
    method = methods(m);

    subplot(4,1,m)
    signalTemp = distancesThresANDAvg.(method);
    signal1 = conv(signalTemp, kernel, 'same');
    signal1 = signal1(5:245);
    plot(1:2:2*(length(scaleW)-8),-(signal1-sum(signal1)/length(signal1))/(sqrt(var(signal1))),LineWidth=2.0)
    xlabel('Time (s)','FontSize',15,'FontWeight','bold')
    signal = scaleW;
    signal = signal(5:245);
    hold on
    plot(1:2:2*(length(scaleW)-8),(signal-sum(signal)/length(signal))/(sqrt(var(signal))),LineWidth=2.0)
    hold off
    title(method)
    ylim([-2.1,2])

    values(m,1) = max(abs(xcorr(-signal1,signal,'coeff')));
    %legend('Distances','Emotion contagion scale','FontSize',12,'FontWeight','bold')
end

sgtitle('Original')
fontsize(fig,15,"points")
tightfig

values

%% Save plots

figure()
%{
for m = 1:4
    method = methods(m);

    subplot(3,1,1)
    signalTemp = distancesThresANDAvg.Pear;
    signal1 = conv(signalTemp, kernel, 'same');
    signal1 = signal1(5:245);
    patch([130 170 170 130], [-3 -3,6.5 6.5], [200/256, 232/256, 200/256])
    patch([355 395 395 355], [-3 -3,6.5 6.5], [255/256, 255/256, 200/256])
    hold on
    signal = scaleW;
    signal = signal(5:245);
    %hold on
    plot(1:2:2*(length(scaleW)-8),(signal-sum(signal)/length(signal))/(sqrt(var(signal))),LineWidth=2.0)
    plot(1:2:2*(length(scaleW)-8),-(signal1-sum(signal1)/length(signal1))/(sqrt(var(signal1))),LineWidth=2.0)
    xlabel('Time (s)','FontSize',15,'FontWeight','bold')
    hold off
    %title(method)
    ylim([-3,6.5])

    values(m,1) = max(abs(xcorr(-signal1,signal,'coeff')));
    legend('', '','Graph-dissimilarity metric','Emotion contagion scale','FontSize',12,'FontWeight','bold')
end
%}

subplot(3,1,1)
    signalTemp = distancesThresANDAvg.Spar;
    signal1 = conv(signalTemp, kernel, 'same');
    signal1 = signal1(5:245);
    patch([120 160 160 120], [-3 -3,6.5 6.5], [200/256, 232/256, 200/256])
    patch([355 395 395 355], [-3 -3,6.5 6.5], [255/256, 255/256, 200/256])
    hold on
    signal = scaleW;
    signal = signal(5:245);
    %hold on
    plot(1:2:2*(length(scaleW)-8),-(signal1-sum(signal1)/length(signal1))/(sqrt(var(signal1))),LineWidth=2.0)
    plot(1:2:2*(length(scaleW)-8),(signal-sum(signal)/length(signal))/(sqrt(var(signal))),LineWidth=2.0)
    xlabel('Time (s)','FontSize',15,'FontWeight','bold')
    hold off
    %title(method)
    ylim([-3,4])
    xL=xlim;
    yL=ylim;
    text(0.05*xL(2),0.99*yL(2),'Sparsity','HorizontalAlignment','left','VerticalAlignment','top','FontSize',20,'FontWeight','bold')

    values(m,1) = max(abs(xcorr(-signal1,signal,'coeff')));
    legend('', '','Graph-dissimilarity metric','Emotion contagion scale','FontSize',10,'FontWeight','bold','Orientation','Horizontal')

    subplot(3,1,2)
    signalTemp = distancesThresANDAvg.Pear;
    signal1 = conv(signalTemp, kernel, 'same');
    signal1 = signal1(5:245);
    patch([120 160 160 120], [-3 -3,6.5 6.5], [200/256, 232/256, 200/256])
    patch([355 395 395 355], [-3 -3,6.5 6.5], [255/256, 255/256, 200/256])
    hold on
    signal = scaleW;
    signal = signal(5:245);
    %hold on
    plot(1:2:2*(length(scaleW)-8),-(signal1-sum(signal1)/length(signal1))/(sqrt(var(signal1))),LineWidth=2.0)
    plot(1:2:2*(length(scaleW)-8),(signal-sum(signal)/length(signal))/(sqrt(var(signal))),LineWidth=2.0)
    
    xlabel('Time (s)','FontSize',15,'FontWeight','bold')
    hold off
    %title(method)
    ylim([-3,4])
    xL=xlim;
    yL=ylim;
    text(0.05*xL(2),0.99*yL(2),'Pearson','HorizontalAlignment','left','VerticalAlignment','top','FontSize',20,'FontWeight','bold')
fontsize(fig,15,"points")
print('distance','-dpdf','-bestfit')