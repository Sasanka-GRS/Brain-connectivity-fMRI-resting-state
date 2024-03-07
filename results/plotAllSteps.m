clc
clear

%% Extraction

data = load('..\extract_data\extracted_data\303_data_voxel.mat').data;

fNames = fieldnames(data);
L = length(fNames);

xi = data.(fNames{1});
S = size(xi);

timeseries = zeros(S(1),L);
time = 1:2:2*S(1);

for i = 1:L
    xi = data.(fNames{i});
    S = size(xi);
    voxel = randi([1,S(2)]);
    timeseries(:,i) = xi(:,voxel);
end

% Plot a single time-series
%{
figure()
plot(time,timeseries(:,1),'r',LineWidth=1.5)
xlabel('Time (s)')
ylabel('BOLD')
title('Timeseries of a single voxel ACC\_L (Unnormalized)')

% Plot single voxel from each region
figure()
hold on
for i = 1:L
    plot(time,timeseries(:,i),LineWidth=1.5)
end
hold off
legend(fNames)
xlabel('Time (s)')
ylabel('BOLD')
title('Timeseries of a single voxel from all regions (Unnormalized)')
%}

timeseriesUn = timeseries;
    
%% Normalize

data = load('..\normalize_data\normalized_data\303_data_voxel_N.mat').data;

fNames = fieldnames(data);
L = length(fNames);

xi = data.(fNames{1});
S = size(xi);

timeseries = zeros(S(1),L);
time = 1:2:2*S(1);

for i = 1:L
    xi = data.(fNames{i});
    S = size(xi);
    voxel = randi([1,S(2)]);
    timeseries(:,i) = xi(:,voxel);
end

% Plot a single time-series
%{
figure()
plot(time,timeseries(:,1),'r',LineWidth=1.5)
xlabel('Time (s)')
ylabel('BOLD')
title('Timeseries of a single voxel in ACC\_L (Normalized)')

% Plot single voxel from each region
figure()
hold on
for i = 1:L
    plot(time,timeseries(:,i),LineWidth=1.5)
end
hold off
legend(fNames)
xlabel('Time (s)')
ylabel('BOLD')
title('Timeseries of a single voxel from all regions (Normalized)')
%}

timeseriesN = timeseries;

%% Transition to Normalize

dataRaw = load('..\extract_data\extracted_data\303_data_voxel.mat').data;
dataNorm = load('..\normalize_data\normalized_data\303_data_voxel_N.mat').data;

timeseriesRaw = dataRaw.ACC_L;
timeseriesRaw = timeseriesRaw(:,50);

timeseriesNorm = dataNorm.ACC_L;
timeseriesNorm = timeseriesNorm(:,50);

%{
figure()
subplot(2,1,1)
plot(timeseriesRaw,'r',LineWidth=1.5)
xlabel('Time (s)')
ylabel('BOLD')
title('Timeseries of a single voxel in ACC\_L (Unnormalized)')
subplot(2,1,2)
plot(timeseriesNorm,'b',LineWidth=1.5)
xlabel('Time (s)')
ylabel('BOLD')
title('Timeseries of a single voxel in ACC\_L (Normalized)')
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fig = figure;
subplot(2,1,1)
hold on
for i = 1:L
    plot(time,timeseriesUn(:,i),LineWidth=1.5)
end
hold off
xticklabels('')
xlim([0,512])
ylim([0,2000])
xL=xlim;
yL=ylim;
text(0.99*xL(2),0.99*yL(2),'Raw BOLD','HorizontalAlignment','right','VerticalAlignment','top','FontSize',12,'FontWeight','bold')
subplot(2,1,2)
hold on
for i = 1:L
    %if()
    plot(time,timeseriesN(:,i),LineWidth=1.5)
end
hold off
xlim([0,512])
ylim([-120,150])
xlabel('Time (s)','FontSize',15);
xL=xlim;
yL=ylim;
text(0.99*xL(2),0.99*yL(2),'Normalized BOLD','HorizontalAlignment','right','VerticalAlignment','top','FontSize',12,'FontWeight','bold')
han=axes(fig,'visible','off'); 
han.Title.Visible='on';
han.XLabel.Visible='on';
han.YLabel.Visible='on';
%ylabel(han,'BOLD', 'FontSize', 15);
fontsize(fig,15,"points")
tightfig
print('normalize','-dpdf','-bestfit')

%% HPF

data = load('..\hpf\hpf_data\303_data_voxel_N_hpf.mat').data;

fNames = fieldnames(data);
L = length(fNames);

xi = data.(fNames{1});
S = size(xi);

timeseries = zeros(S(1),L);
time = 1:2:2*S(1);

for i = 1:L
    xi = data.(fNames{i});
    S = size(xi);
    voxel = randi([1,S(2)]);
    timeseries(:,i) = xi(:,voxel);
end

% Plot a single time-series
%{
figure()
plot(time,timeseries(:,1),'r',LineWidth=1.5)
xlabel('Time (s)')
ylabel('BOLD')
title('High Pass version of single voxel in ACC\_L')

% Plot single voxel from each region
figure()
hold on
for i = 1:L
    plot(time,timeseries(:,i),LineWidth=1.5)
end
hold off
legend(fNames)
xlabel('Time (s)')
ylabel('BOLD')
title('High Pass version of single voxel from all regions')
%}

%% Transition to HPF

dataNorm = load('..\normalize_data\normalized_data\303_data_voxel_N.mat').data;
dataHPF = load('..\hpf\hpf_data\303_data_voxel_N_hpf.mat').data;

timeseriesNorm = dataNorm.ACC_L;
timeseriesNorm = timeseriesNorm(:,50);

timeseriesHPF = dataHPF.ACC_L;
timeseriesHPF = timeseriesHPF(:,50);
%{
figure()
subplot(2,1,1)
plot(timeseriesNorm,'r',LineWidth=1.5)
xlabel('Time (s)')
ylabel('BOLD')
title('Timeseries of a single voxel in ACC\_L (Normalized)')
subplot(2,1,2)
plot(timeseriesHPF,'b',LineWidth=1.5)
xlabel('Time (s)')
ylabel('BOLD')
title('High pass version of a single voxel in ACC\_L')
%}

%% Clustering

data = load('..\clustering\clustered_data\303_data_clustered.mat').data;

fNames = fieldnames(data);
L = length(fNames);

xi = data.(fNames{1});
S = size(xi);

timeseries = zeros(S(1),L);
time = 1:2:2*S(1);

for i = 1:L
    xi = data.(fNames{i});
    S = size(xi);
    voxel = randi([1,S(2)]);
    timeseries(:,i) = xi(:,voxel);
end

% Plot a single time-series
%{
figure()
plot(time,timeseries(:,1),'r',LineWidth=1.5)
xlabel('Time (s)')
ylabel('BOLD')
title('Single voxel of clustered data in ACC\_L')

% Plot single voxel from each region
figure()
hold on
for i = 1:L
    plot(time,timeseries(:,i),LineWidth=1.5)
end
hold off
legend(fNames)
xlabel('Time (s)')
ylabel('BOLD')
title('Single voxel of clustered data in all regions')
%}

%% Transition to clustering

dataHPF = load('..\hpf\hpf_data\303_data_voxel_N_hpf.mat').data;
dataClu = load('..\clustering\clustered_data\303_data_clustered.mat').data;

timeseriesHPF = dataHPF.ACC_L;
S = size(timeseriesHPF);
timeseriesHPF = sum(timeseriesHPF,2)/S(2);

timeseriesClu = dataClu.ACC_L;
S = size(timeseriesClu);
timeseriesClu = sum(timeseriesClu,2)/S(2);
%{
figure()
subplot(2,1,1)
plot(timeseriesHPF,'r',LineWidth=1.5)
xlabel('Time (s)')
ylabel('BOLD')
title('High pass signals average in ACC\_L')
subplot(2,1,2)
plot(timeseriesClu,'b',LineWidth=1.5)
xlabel('Time (s)')
ylabel('BOLD')
title('Cluster average in ACC\_L')
%}

%% Combination

data = load('..\combination\combined_data\303_data_combined.mat').data;

S = size(data);
N = S(2);
T = S(1);

timeseries = data(:,1);
time = 1:2:2*T;

% Plot a combined time-series
%{
figure()
plot(time,timeseries,'r',LineWidth=1.5)
xlabel('Time (s)')
ylabel('BOLD')
title('Combined data in ACC\_L')
%}

%% Compare Combination with others

dataRaw = load('..\extract_data\extracted_data\303_data_voxel.mat').data.ACC_L;
dataNorm = load('..\normalize_data\normalized_data\303_data_voxel_N.mat').data.ACC_L;
dataHPF = load('..\hpf\hpf_data\303_data_voxel_N_hpf.mat').data.ACC_L;
dataClu = load('..\clustering\clustered_data\303_data_clustered.mat').data.ACC_L;
dataCom = load('..\combination\combined_data\303_data_combined.mat').data;

S = size(dataRaw);
T = S(1);
timeseriesRaw = sum(dataRaw,2)/S(2);

S = size(dataNorm);
timeseriesNorm = sum(dataNorm,2)/S(2);

S = size(dataHPF);
timeseriesHPF = sum(dataHPF,2)/S(2);

S = size(dataClu);
timeseriesClu = sum(dataClu,2)/S(2);

timeseriesCom = dataCom(:,1);

time = 1:2:2*T;
%{
figure()
subplot(5,1,1)
plot(time,timeseriesRaw,'r',LineWidth=1.5)
xlabel('Time (s)')
ylabel('BOLD')
title('Raw Combined ACC\_L')
subplot(5,1,2)
plot(time,timeseriesNorm,'g',LineWidth=1.5)
xlabel('Time (s)')
ylabel('BOLD')
title('Normalized Combined ACC\_L')
subplot(5,1,3)
plot(time,timeseriesHPF,'b',LineWidth=1.5)
xlabel('Time (s)')
ylabel('BOLD')
title('HPF Combined ACC\_L')
subplot(5,1,4)
plot(time,timeseriesClu,'black',LineWidth=1.5)
xlabel('Time (s)')
ylabel('BOLD')
title('Clustered Combined ACC\_L')
subplot(5,1,5)
plot(time,timeseriesCom,'black',LineWidth=1.5)
xlabel('Time (s)')
ylabel('BOLD')
title('Final ACC\_L')
sgtitle('Progress in each step')
%}

fig = figure;
subplot(4,1,1)
plot(time,timeseriesRaw,'black',LineWidth=1.5)
xticklabels('')
xlim([0,512])
ylim([1000,1060])
xL=xlim;
yL=ylim;
text(0.999*xL(2),0.999*yL(2),'Raw BOLD','HorizontalAlignment','right','VerticalAlignment','top','FontSize',12,'FontWeight','bold')
subplot(4,1,2)
plot(time,timeseriesNorm,'g',LineWidth=1.5)
xticklabels('')
xlim([0,512])
ylim([-15,20])
xL=xlim;
yL=ylim;
text(0.99*xL(2),0.99*yL(2),'Normalized BOLD','HorizontalAlignment','right','VerticalAlignment','top','FontSize',12,'FontWeight','bold')
subplot(4,1,3)
plot(time,timeseriesNorm,'b',LineWidth=1.5)
xticklabels('')
xlim([0,512])
ylim([-15,20])
xL=xlim;
yL=ylim;
text(0.99*xL(2),0.99*yL(2),'High Pass Filtered','HorizontalAlignment','right','VerticalAlignment','top','FontSize',12,'FontWeight','bold')
subplot(4,1,4)
plot(time,timeseriesCom,'r',LineWidth=1.5)
xlim([0,512])
ylim([-30,40])
xlabel('Time (s)','FontSize',15);
xL=xlim;
yL=ylim;
text(0.99*xL(2),0.99*yL(2),'Clustered and Combined','HorizontalAlignment','right','VerticalAlignment','top','FontSize',12,'FontWeight','bold')
han=axes(fig,'visible','off'); 
han.Title.Visible='on';
han.XLabel.Visible='on';
han.YLabel.Visible='on';
ylabel(han,'ACC\_L', 'FontSize', 15);
fontsize(fig,15,"points")
%sgtitle('ACC\_L')
tightfig
print('progress','-dpdf','-bestfit')