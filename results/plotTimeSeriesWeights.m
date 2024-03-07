%% Extract Data

Sim303 = load("..\graph_learning\graph_data\303_graph_SimWindowWeighted.mat").Graphs_W;
Pear303 = load("..\graph_learning\graph_data\303_graph_PearWindowWeighted.mat").Graphs_W;
Spar303 = load("..\graph_learning\graph_data\303_graph_SparWindowWeighted.mat").Graphs_W;
Smooth303 = load("..\graph_learning\graph_data\303_graph_SmoothWindowWeighted.mat").Graphs_W;

Sim378 = load("..\graph_learning\graph_data\378_graph_SimWindowWeighted.mat").Graphs_W;
Pear378 = load("..\graph_learning\graph_data\378_graph_PearWindowWeighted.mat").Graphs_W;
Spar378 = load("..\graph_learning\graph_data\378_graph_SparWindowWeighted.mat").Graphs_W;
Smooth378 = load("..\graph_learning\graph_data\378_graph_SmoothWindowWeighted.mat").Graphs_W;

Sim386 = load("..\graph_learning\graph_data\386_graph_SimWindowWeighted.mat").Graphs_W;
Pear386 = load("..\graph_learning\graph_data\386_graph_PearWindowWeighted.mat").Graphs_W;
Spar386 = load("..\graph_learning\graph_data\386_graph_SparWindowWeighted.mat").Graphs_W;
Smooth386 = load("..\graph_learning\graph_data\386_graph_SmoothWindowWeighted.mat").Graphs_W;

Sim797 = load("..\graph_learning\graph_data\797_graph_SimWindowWeighted.mat").Graphs_W;
Pear797 = load("..\graph_learning\graph_data\797_graph_PearWindowWeighted.mat").Graphs_W;
Spar797 = load("..\graph_learning\graph_data\797_graph_SparWindowWeighted.mat").Graphs_W;
Smooth797 = load("..\graph_learning\graph_data\797_graph_SmoothWindowWeighted.mat").Graphs_W;

Sim820 = load("..\graph_learning\graph_data\820_graph_SimWindowWeighted.mat").Graphs_W;
Pear820 = load("..\graph_learning\graph_data\820_graph_PearWindowWeighted.mat").Graphs_W;
Spar820 = load("..\graph_learning\graph_data\820_graph_SparWindowWeighted.mat").Graphs_W;
Smooth820 = load("..\graph_learning\graph_data\820_graph_SmoothWindowWeighted.mat").Graphs_W;

node = load("..\extract_data\nodeLabels.mat").names;

%% Important Regions

R1 = "Insula_L";
R2 = "Insula_R";

N = size(Sim378);
N = N(3);

time = 1:2:2*N;

%% Calculate Indices

indexR1 = find(node==R1);
indexR2 = find(node==R2);

%% Similarity 

Sim303Signal = squeeze(Sim303(indexR1,indexR2,:)/max(max(Sim303(indexR1,indexR2,:))));
Sim378Signal = squeeze(Sim378(indexR1,indexR2,:)/max(max(Sim378(indexR1,indexR2,:))));
Sim386Signal = squeeze(Sim386(indexR1,indexR2,:)/max(max(Sim386(indexR1,indexR2,:))));
Sim797Signal = squeeze(Sim797(indexR1,indexR2,:)/max(max(Sim797(indexR1,indexR2,:))));
Sim820Signal = squeeze(Sim820(indexR1,indexR2,:)/max(max(Sim820(indexR1,indexR2,:))));

fig = figure;
subplot(5,1,1)
plot(time,Sim303Signal,LineWidth=1.5);
xlabel('Time (s)')
ylabel('W')
xL=xlim;
yL=ylim;
text(0.99*xL(2),0.99*yL(2),'303','HorizontalAlignment','right','VerticalAlignment','top','FontSize',14,'FontWeight','bold')
subplot(5,1,2)
plot(time,Sim378Signal,LineWidth=1.5);
xlabel('Time (s)')
ylabel('W')
title('Similarity 378 Insula (L) and Triangularis (R)');
subplot(5,1,3)
plot(time,Sim386Signal,LineWidth=1.5);
xlabel('Time (s)')
title('Similarity 386 Insula (L) and Triangularis (R)');
subplot(5,1,4)
plot(time,Sim797Signal,LineWidth=1.5);
xlabel('Time (s)')
title('Similarity 797 Insula (L) and Triangularis (R)');
subplot(5,1,5)
plot(time,Sim820Signal,LineWidth=1.5);
xlabel('Time (s)')
title('Similarity 820 Insula (L) and Triangularis (R)');
sgtitle('Variation across subjects Similarity','FontSize',20)

%% Sparsity

Spar303Signal = real(squeeze(Spar303(indexR1,indexR2,:)/max(max(Spar303(indexR1,indexR2,:)))));
Spar378Signal = real(squeeze(Spar378(indexR1,indexR2,:)/max(max(Spar378(indexR1,indexR2,:)))));
Spar386Signal = real(squeeze(Spar386(indexR1,indexR2,:)/max(max(Spar386(indexR1,indexR2,:)))));
Spar797Signal = real(squeeze(Spar797(indexR1,indexR2,:)/max(max(Spar797(indexR1,indexR2,:)))));
Spar820Signal = real(squeeze(Spar820(indexR1,indexR2,:)/max(max(Spar820(indexR1,indexR2,:)))));

%{
fig = figure();
subplot(5,1,1)
plot(time,Spar303Signal,LineWidth=1.5);
xticklabels('')
xL=xlim;
yL=ylim;
text(0.99*xL(2),0.99*yL(2),'303','HorizontalAlignment','right','VerticalAlignment','top','FontSize',14,'FontWeight','bold')
subplot(5,1,2)
plot(time,Spar378Signal,LineWidth=1.5);
xticklabels('')
xL=xlim;
yL=ylim;
text(0.99*xL(2),0.99*yL(2),'378','HorizontalAlignment','right','VerticalAlignment','top','FontSize',14,'FontWeight','bold')
subplot(5,1,3)
plot(time,Spar386Signal,LineWidth=1.5);
xticklabels('')
xL=xlim;
yL=ylim;
text(0.99*xL(2),0.99*yL(2),'386','HorizontalAlignment','right','VerticalAlignment','top','FontSize',14,'FontWeight','bold')
subplot(5,1,4)
plot(time,Spar797Signal,LineWidth=1.5);
xticklabels('')
xL=xlim;
yL=ylim;
text(0.99*xL(2),0.99*yL(2),'797','HorizontalAlignment','right','VerticalAlignment','top','FontSize',14,'FontWeight','bold')
subplot(5,1,5)
plot(time,Spar820Signal,LineWidth=1.5);
xL=xlim;
yL=ylim;
text(0.99*xL(2),0.99*yL(2),'820','HorizontalAlignment','right','VerticalAlignment','top','FontSize',14,'FontWeight','bold')
han=axes(fig,'visible','off'); 
han.Title.Visible='on';
han.XLabel.Visible='on';
han.YLabel.Visible='on';
xlabel(han,'Time (s)', 'FontSize', 15);
ylabel(han,'Weight','FontSize',15);
tightfig
fontsize(fig,15,"points")
print('sparsity','-dpdf','-bestfit')
%}

%% Pearson

Pear303Signal = squeeze(Pear303(indexR1,indexR2,:)/max(max(Pear303(indexR1,indexR2,:))));
Pear378Signal = squeeze(Pear378(indexR1,indexR2,:)/max(max(Pear378(indexR1,indexR2,:))));
Pear386Signal = squeeze(Pear386(indexR1,indexR2,:)/max(max(Pear386(indexR1,indexR2,:))));
Pear797Signal = squeeze(Pear797(indexR1,indexR2,:)/max(max(Pear797(indexR1,indexR2,:))));
Pear820Signal = squeeze(Pear820(indexR1,indexR2,:)/max(max(Pear820(indexR1,indexR2,:))));

%{
figure()
subplot(5,1,1)
plot(time,Pear303Signal);
xlabel('Time (s)')
ylabel('W')
title('Pearson 303 Insula (L) and Triangularis (R)');
subplot(5,1,2)
plot(time,Pear378Signal);
xlabel('Time (s)')
ylabel('W')
title('Pearson 378 Insula (L) and Triangularis (R)');
subplot(5,1,3)
plot(time,Pear386Signal);
xlabel('Time (s)')
ylabel('W')
title('Pearson 386 Insula (L) and Triangularis (R)');
subplot(5,1,4)
plot(time,Pear797Signal);
xlabel('Time (s)')
ylabel('W')
title('Pearson 797 Insula (L) and Triangularis (R)');
subplot(5,1,5)
plot(time,Pear820Signal);
xlabel('Time (s)')
ylabel('W')
title('Pearson 820 Insula (L) and Triangularis (R)');
sgtitle('Variation across subjects Pearson')
%}

%% Smoothness

Smooth303Signal = abs(squeeze(Smooth303(indexR1,indexR2,:)/max(max(Smooth303(indexR1,indexR2,:)))));
Smooth378Signal = abs(squeeze(Smooth378(indexR1,indexR2,:)/max(max(Smooth378(indexR1,indexR2,:)))));
Smooth386Signal = abs(squeeze(Smooth386(indexR1,indexR2,:)/max(max(Smooth386(indexR1,indexR2,:)))));
Smooth797Signal = abs(squeeze(Smooth797(indexR1,indexR2,:)/max(max(Smooth797(indexR1,indexR2,:)))));
Smooth820Signal = abs(squeeze(Smooth820(indexR1,indexR2,:)/max(max(Smooth820(indexR1,indexR2,:)))));

%{
figure()
subplot(5,1,1)
plot(time,Smooth303Signal);
xlabel('Time (s)')
ylabel('W')
title('Smoothness 303 Insula (L) and Triangularis (R)');
subplot(5,1,2)
plot(time,Smooth378Signal);
xlabel('Time (s)')
ylabel('W')
title('Smoothness 378 Insula (L) and Triangularis (R)');
subplot(5,1,3)
plot(time,Smooth386Signal);
xlabel('Time (s)')
ylabel('W')
title('Smoothness 386 Insula (L) and Triangularis (R)');
subplot(5,1,4)
plot(time,Smooth797Signal);
xlabel('Time (s)')
ylabel('W')
title('Smoothness 797 Insula (L) and Triangularis (R)');
subplot(5,1,5)
plot(time,Smooth820Signal);
xlabel('Time (s)')
ylabel('W')
title('Smoothness 820 Insula (L) and Triangularis (R)');
sgtitle('Variation across subjects Smoothness')
%}

%% For one subject all methods

fig = figure;
subplot(4,1,1)
plot(time,Sim378Signal,LineWidth=1.5);
xticklabels('')
xL=xlim;
yL=ylim;
text(0.99*xL(2),0.99*yL(2),'Similarity','HorizontalAlignment','right','VerticalAlignment','top','FontSize',12,'FontWeight','bold')
subplot(4,1,2)
plot(time,Spar378Signal,LineWidth=1.5);
xticklabels('')
xL=xlim;
yL=ylim;
text(0.99*xL(2),0.99*yL(2),'Sparsity','HorizontalAlignment','right','VerticalAlignment','top','FontSize',12,'FontWeight','bold')
subplot(4,1,3)
plot(time,Pear378Signal,LineWidth=1.5);
xticklabels('')
xL=xlim;
yL=ylim;
text(0.99*xL(2),0.99*yL(2),'Pearson','HorizontalAlignment','right','VerticalAlignment','top','FontSize',12,'FontWeight','bold')
subplot(4,1,4)
plot(time,Smooth378Signal,LineWidth=1.5);
xL=xlim;
yL=ylim;
text(0.99*xL(2),0.99*yL(2),'Smoothness','HorizontalAlignment','right','VerticalAlignment','top','FontSize',12,'FontWeight','bold')
han=axes(fig,'visible','off'); 
han.Title.Visible='on';
han.XLabel.Visible='on';
han.YLabel.Visible='on';
ylabel(han,'Weight', 'FontSize', 15);
xlabel(han,'Time (s)','FontSize',15);
fontsize(fig,15,"points")
tightfig
%print('303','-dpdf','-bestfit')