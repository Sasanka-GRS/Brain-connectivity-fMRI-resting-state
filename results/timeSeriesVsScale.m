%% Extract Data

Data303 = load("..\combination\combined_data\303_data_combined.mat").data;
Data378 = load("..\combination\combined_data\378_data_combined.mat").data;
Data386 = load("..\combination\combined_data\386_data_combined.mat").data;
Data797 = load("..\combination\combined_data\797_data_combined.mat").data;
Data820 = load("..\combination\combined_data\820_data_combined.mat").data;

node = load("..\extract_data\nodeLabels.mat").numbers;
scale = load("..\extract_data\rating.mat").scale;

%% Scale downsampling

scaleD = scale(1:2:end);

%% Plot scale

f = figure;
f.Position = [0 0 900 800];
plot(scale,LineWidth=1.5);
xlabel('Time (s)','FontSize',40)
ylabel('Scale','FontSize',40)
title('Scale vs Time','FontSize',40)
xlim([0,512])
tightfig
%legend('303','378','386','797','820','FontSize',25)
fontsize(f,20,"points")
%print('scale','-dpdf','-fillpage')

%% Important Region

R1 = "Insula_L";

N = size(Data378);
N = N(1);

time = 1:2:2*N;

%% Calculate Index

indexR1 = find(node==R1);

%% Extracting time series

Signal303 = squeeze(Data303(:,indexR1));
Signal378 = squeeze(Data378(:,indexR1));
Signal386 = squeeze(Data386(:,indexR1));
Signal797 = squeeze(Data797(:,indexR1));
Signal820 = squeeze(Data820(:,indexR1));

%% Plotting BOLD vs scale for all on one plot

f = figure;
f.Position = [0 0 900 800];
scatter(scaleD,Signal303,30,'o','filled');
hold on
scatter(scaleD,Signal378,30,'o','filled');
scatter(scaleD,Signal386,30,'o','filled');
scatter(scaleD,Signal797,30,'o','filled');
scatter(scaleD,Signal820,30,'o','filled');
hold off
xlabel('Scale','FontSize',40)
ylabel('BOLD','FontSize',40)
legend('303','378','386','797','820','FontSize',25)
fontsize(f,20,"points")
%print('scatter','-dpdf','-fillpage')

%% Quantize Samples to precision 0.03

mini = min(scaleD);
maxi = max(scaleD);
precision = 0.03;

scaleNew = mini:precision:maxi;
L = length(scaleD);
L1 = length(scaleNew);

scaleDNew = zeros(L,1);

for i = 1:L
    flag = 0;
    for j = 1:L1
        if(scaleD(i)>=scaleNew(j))
            scaleDNew(i) = scaleNew(j);
            flag = 1;
        end
    end
    if(flag==0)
        scaleDNew(i) = scaleNew(end);
    end
end

%% Making 2-D matrix for box plot

scaleUnique = sort(unique(scaleDNew));
L = length(scaleUnique);

bold303 = [];
bold378 = [];
bold386 = [];
bold797 = [];
bold820 = [];

groups303 = [];
groups378 = [];
groups386 = [];
groups797 = [];
groups820 = [];

for i = 1:L
    scaleHere = scaleUnique(i);
    
    bold303Here = Signal303(scaleDNew==scaleHere);
    L1 = length(bold303Here);
    bold303 = [bold303;bold303Here];
    groups303 = [groups303;scaleHere*ones(L1,1)];

    bold378Here = Signal378(scaleDNew==scaleHere);
    L1 = length(bold378Here);
    bold378 = [bold378;bold378Here];
    groups378 = [groups378;scaleHere*ones(L1,1)];

    bold386Here = Signal386(scaleDNew==scaleHere);
    L1 = length(bold386Here);
    bold386 = [bold386;bold386Here];
    groups386 = [groups386;scaleHere*ones(L1,1)];

    bold797Here = Signal797(scaleDNew==scaleHere);
    L1 = length(bold797Here);
    bold797 = [bold797;bold797Here];
    groups797 = [groups797;scaleHere*ones(L1,1)];

    bold820Here = Signal820(scaleDNew==scaleHere);
    L1 = length(bold820Here);
    bold820 = [bold820;bold820Here];
    groups820 = [groups820;scaleHere*ones(L1,1)];

end

fig = figure;
fig.Position = [0 0 900 800];
tiledlayout(5,1,'TileSpacing','tight','Padding','tight')
nexttile
boxplot(bold303,groups303);
xticklabels('')
xL=xlim;
yL=ylim;
text(0.99*xL(2),0.99*yL(2),'303','HorizontalAlignment','right','VerticalAlignment','top','FontSize',14,'FontWeight','bold')
nexttile
boxplot(bold378,groups378);
xticklabels('')
xL=xlim;
yL=ylim;
text(0.99*xL(2),0.99*yL(2),'378','HorizontalAlignment','right','VerticalAlignment','top','FontSize',14,'FontWeight','bold')
nexttile
boxplot(bold386,groups386);
ylabel('BOLD','FontSize',15)
xticklabels('')
xL=xlim;
yL=ylim;
text(0.99*xL(2),0.99*yL(2),'386','HorizontalAlignment','right','VerticalAlignment','top','FontSize',14,'FontWeight','bold')
nexttile
boxplot(bold797,groups797);
xticklabels('')
xL=xlim;
yL=ylim;
text(0.99*xL(2),0.99*yL(2),'797','HorizontalAlignment','right','VerticalAlignment','top','FontSize',14,'FontWeight','bold')
nexttile
boxplot(bold820,groups820);
xlabel('Scale','FontSize',15)
xL=xlim;
yL=ylim;
text(0.99*xL(2),0.99*yL(2),'820','HorizontalAlignment','right','VerticalAlignment','top','FontSize',14,'FontWeight','bold')
fontsize(fig,20,"points")
tightfig
%print('boxplot','-dpdf','-bestfit')