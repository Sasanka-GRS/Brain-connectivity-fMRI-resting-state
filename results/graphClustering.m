%% Read the data

Sim303 = load("..\graph_learning\graph_data\303_graph_SimWindowWeighted.mat").Graphs_W;
Sim378 = load("..\graph_learning\graph_data\378_graph_SimWindowWeighted.mat").Graphs_W;
Sim386 = load("..\graph_learning\graph_data\386_graph_SimWindowWeighted.mat").Graphs_W;
Sim797 = load("..\graph_learning\graph_data\797_graph_SimWindowWeighted.mat").Graphs_W;
Sim820 = load("..\graph_learning\graph_data\820_graph_SimWindowWeighted.mat").Graphs_W;
Sim998 = load("..\graph_learning\graph_data\998_graph_SimWindowWeighted.mat").Graphs_W;
Sim1092 = load("..\graph_learning\graph_data\1092_graph_SimWindowWeighted.mat").Graphs_W;
Sim1093 = load("..\graph_learning\graph_data\1093_graph_SimWindowWeighted.mat").Graphs_W;
Sim1171 = load("..\graph_learning\graph_data\1171_graph_SimWindowWeighted.mat").Graphs_W;
Sim1271 = load("..\graph_learning\graph_data\1271_graph_SimWindowWeighted.mat").Graphs_W;
Sim1352 = load("..\graph_learning\graph_data\1352_graph_SimWindowWeighted.mat").Graphs_W;
Sim1511 = load("..\graph_learning\graph_data\1511_graph_SimWindowWeighted.mat").Graphs_W;
Sim1603 = load("..\graph_learning\graph_data\1603_graph_SimWindowWeighted.mat").Graphs_W;
Sim1629 = load("..\graph_learning\graph_data\1629_graph_SimWindowWeighted.mat").Graphs_W;

Pear303 = load("..\graph_learning\graph_data\303_graph_PearWindowWeighted.mat").Graphs_W;
Pear378 = load("..\graph_learning\graph_data\378_graph_PearWindowWeighted.mat").Graphs_W;
Pear386 = load("..\graph_learning\graph_data\386_graph_PearWindowWeighted.mat").Graphs_W;
Pear797 = load("..\graph_learning\graph_data\797_graph_PearWindowWeighted.mat").Graphs_W;
Pear820 = load("..\graph_learning\graph_data\820_graph_PearWindowWeighted.mat").Graphs_W;
Pear998 = load("..\graph_learning\graph_data\998_graph_PearWindowWeighted.mat").Graphs_W;
Pear1092 = load("..\graph_learning\graph_data\1092_graph_PearWindowWeighted.mat").Graphs_W;
Pear1093 = load("..\graph_learning\graph_data\1093_graph_PearWindowWeighted.mat").Graphs_W;
Pear1171 = load("..\graph_learning\graph_data\1171_graph_PearWindowWeighted.mat").Graphs_W;
Pear1271 = load("..\graph_learning\graph_data\1271_graph_PearWindowWeighted.mat").Graphs_W;
Pear1352 = load("..\graph_learning\graph_data\1352_graph_PearWindowWeighted.mat").Graphs_W;
Pear1511 = load("..\graph_learning\graph_data\1511_graph_PearWindowWeighted.mat").Graphs_W;
Pear1603 = load("..\graph_learning\graph_data\1603_graph_PearWindowWeighted.mat").Graphs_W;
Pear1629 = load("..\graph_learning\graph_data\1629_graph_PearWindowWeighted.mat").Graphs_W;

Spar303 = load("..\graph_learning\graph_data\303_graph_SparWindowWeighted.mat").Graphs_W;
Spar378 = load("..\graph_learning\graph_data\378_graph_SparWindowWeighted.mat").Graphs_W;
Spar386 = load("..\graph_learning\graph_data\386_graph_SparWindowWeighted.mat").Graphs_W;
Spar797 = load("..\graph_learning\graph_data\797_graph_SparWindowWeighted.mat").Graphs_W;
Spar820 = load("..\graph_learning\graph_data\820_graph_SparWindowWeighted.mat").Graphs_W;
Spar998 = load("..\graph_learning\graph_data\998_graph_SparWindowWeighted.mat").Graphs_W;
Spar1092 = load("..\graph_learning\graph_data\1092_graph_SparWindowWeighted.mat").Graphs_W;
Spar1093 = load("..\graph_learning\graph_data\1093_graph_SparWindowWeighted.mat").Graphs_W;
Spar1171 = load("..\graph_learning\graph_data\1171_graph_SparWindowWeighted.mat").Graphs_W;
Spar1271 = load("..\graph_learning\graph_data\1271_graph_SparWindowWeighted.mat").Graphs_W;
Spar1352 = load("..\graph_learning\graph_data\1352_graph_SparWindowWeighted.mat").Graphs_W;
Spar1511 = load("..\graph_learning\graph_data\1511_graph_SparWindowWeighted.mat").Graphs_W;
Spar1603 = load("..\graph_learning\graph_data\1603_graph_SparWindowWeighted.mat").Graphs_W;
Spar1629 = load("..\graph_learning\graph_data\1629_graph_SparWindowWeighted.mat").Graphs_W;

Smooth303 = load("..\graph_learning\graph_data\303_graph_SmoothWindowWeighted.mat").Graphs_W;
Smooth378 = load("..\graph_learning\graph_data\378_graph_SmoothWindowWeighted.mat").Graphs_W;
Smooth386 = load("..\graph_learning\graph_data\386_graph_SmoothWindowWeighted.mat").Graphs_W;
Smooth797 = load("..\graph_learning\graph_data\797_graph_SmoothWindowWeighted.mat").Graphs_W;
Smooth820 = load("..\graph_learning\graph_data\820_graph_SmoothWindowWeighted.mat").Graphs_W;
Smooth998 = load("..\graph_learning\graph_data\998_graph_SmoothWindowWeighted.mat").Graphs_W;
Smooth1092 = load("..\graph_learning\graph_data\1092_graph_SmoothWindowWeighted.mat").Graphs_W;
Smooth1093 = load("..\graph_learning\graph_data\1093_graph_SmoothWindowWeighted.mat").Graphs_W;
Smooth1171 = load("..\graph_learning\graph_data\1171_graph_SmoothWindowWeighted.mat").Graphs_W;
Smooth1271 = load("..\graph_learning\graph_data\1271_graph_SmoothWindowWeighted.mat").Graphs_W;
Smooth1352 = load("..\graph_learning\graph_data\1352_graph_SmoothWindowWeighted.mat").Graphs_W;
Smooth1511 = load("..\graph_learning\graph_data\1511_graph_SmoothWindowWeighted.mat").Graphs_W;
Smooth1603 = load("..\graph_learning\graph_data\1603_graph_SmoothWindowWeighted.mat").Graphs_W;
Smooth1629 = load("..\graph_learning\graph_data\1629_graph_SmoothWindowWeighted.mat").Graphs_W;

scale = load("..\extract_data\rating.mat").scale;

%% Window scale

MOVIE = 1;

if(MOVIE==1)
    scaleD = scale(1:2:end);
    L = length(scaleD);
    Num = 8; % Window Length

    scaleW = zeros(L-Num+1,1);

    for i = 1:L-Num+1
        window = scaleD(i:i+Num-1);
        ward = sum(window,1)/Num;
        scaleW(i) = ward;
    end
else
    scale = scale(6:end-8);
    scaleD = scale(1:2:end);
    L = length(scaleD);
    Num = 8; % Window Length

    scaleW = zeros(L-Num+1,1);

    for i = 1:L-Num+1
        window = scaleD(i:i+Num-1);
        ward = sum(window,1)/Num;
        scaleW(i) = ward;
    end
end

%% Flatten

L = size(Spar303);
N = L(1);
L = L(3);

YSim303 = zeros(N*N,L);
YSim378 = zeros(N*N,L);
YSim386 = zeros(N*N,L);
YSim797 = zeros(N*N,L);
YSim820 = zeros(N*N,L);
YSim998 = zeros(N*N,L);
YSim1092 = zeros(N*N,L);
YSim1093 = zeros(N*N,L);
YSim1171 = zeros(N*N,L);
YSim1271 = zeros(N*N,L);
YSim1352 = zeros(N*N,L);
YSim1511 = zeros(N*N,L);
YSim1603 = zeros(N*N,L);
YSim1629 = zeros(N*N,L);

YPear303 = zeros(N*N,L);
YPear378 = zeros(N*N,L);
YPear386 = zeros(N*N,L);
YPear797 = zeros(N*N,L);
YPear820 = zeros(N*N,L);
YPear998 = zeros(N*N,L);
YPear1092 = zeros(N*N,L);
YPear1093 = zeros(N*N,L);
YPear1171 = zeros(N*N,L);
YPear1271 = zeros(N*N,L);
YPear1352 = zeros(N*N,L);
YPear1511 = zeros(N*N,L);
YPear1603 = zeros(N*N,L);
YPear1629 = zeros(N*N,L);

YSpar303 = zeros(N*N,L);
YSpar378 = zeros(N*N,L);
YSpar386 = zeros(N*N,L);
YSpar797 = zeros(N*N,L);
YSpar820 = zeros(N*N,L);
YSpar998 = zeros(N*N,L);
YSpar1092 = zeros(N*N,L);
YSpar1093 = zeros(N*N,L);
YSpar1171 = zeros(N*N,L);
YSpar1271 = zeros(N*N,L);
YSpar1352 = zeros(N*N,L);
YSpar1511 = zeros(N*N,L);
YSpar1603 = zeros(N*N,L);
YSpar1629 = zeros(N*N,L);

YSmooth303 = zeros(N*N,L);
YSmooth378 = zeros(N*N,L);
YSmooth386 = zeros(N*N,L);
YSmooth797 = zeros(N*N,L);
YSmooth820 = zeros(N*N,L);
YSmooth998 = zeros(N*N,L);
YSmooth1092 = zeros(N*N,L);
YSmooth1093 = zeros(N*N,L);
YSmooth1171 = zeros(N*N,L);
YSmooth1271 = zeros(N*N,L);
YSmooth1352 = zeros(N*N,L);
YSmooth1511 = zeros(N*N,L);
YSmooth1603 = zeros(N*N,L);
YSmooth1629 = zeros(N*N,L);

for i = 1:L
    YSim303(:,i) = real(reshape(Sim303(:,:,i).',1,[]));
    YSim378(:,i) = real(reshape(Sim378(:,:,i).',1,[]));
    YSim386(:,i) = real(reshape(Sim386(:,:,i).',1,[]));
    YSim797(:,i) = real(reshape(Sim797(:,:,i).',1,[]));
    YSim820(:,i) = real(reshape(Sim820(:,:,i).',1,[]));
    YSim998(:,i) = real(reshape(Sim998(:,:,i).',1,[]));
    YSim1092(:,i) = real(reshape(Sim1092(:,:,i).',1,[]));
    YSim1093(:,i) = real(reshape(Sim1093(:,:,i).',1,[]));
    YSim1171(:,i) = real(reshape(Sim1171(:,:,i).',1,[]));
    YSim1271(:,i) = real(reshape(Sim1271(:,:,i).',1,[]));
    YSim1352(:,i) = real(reshape(Sim1352(:,:,i).',1,[]));
    YSim1511(:,i) = real(reshape(Sim1511(:,:,i).',1,[]));
    YSim1603(:,i) = real(reshape(Sim1603(:,:,i).',1,[]));
    YSim1629(:,i) = real(reshape(Sim1629(:,:,i).',1,[]));

    YPear303(:,i) = real(reshape(Pear303(:,:,i).',1,[]));
    YPear378(:,i) = real(reshape(Pear378(:,:,i).',1,[]));
    YPear386(:,i) = real(reshape(Pear386(:,:,i).',1,[]));
    YPear797(:,i) = real(reshape(Pear797(:,:,i).',1,[]));
    YPear820(:,i) = real(reshape(Pear820(:,:,i).',1,[]));
    YPear998(:,i) = real(reshape(Pear998(:,:,i).',1,[]));
    YPear1092(:,i) = real(reshape(Pear1092(:,:,i).',1,[]));
    YPear1093(:,i) = real(reshape(Pear1093(:,:,i).',1,[]));
    YPear1171(:,i) = real(reshape(Pear1171(:,:,i).',1,[]));
    YPear1271(:,i) = real(reshape(Pear1271(:,:,i).',1,[]));
    YPear1352(:,i) = real(reshape(Pear1352(:,:,i).',1,[]));
    YPear1511(:,i) = real(reshape(Pear1511(:,:,i).',1,[]));
    YPear1603(:,i) = real(reshape(Pear1603(:,:,i).',1,[]));
    YPear1629(:,i) = real(reshape(Pear1629(:,:,i).',1,[]));

    YSpar303(:,i) = real(reshape(Spar303(:,:,i).',1,[]));
    YSpar378(:,i) = real(reshape(Spar378(:,:,i).',1,[]));
    YSpar386(:,i) = real(reshape(Spar386(:,:,i).',1,[]));
    YSpar797(:,i) = real(reshape(Spar797(:,:,i).',1,[]));
    YSpar820(:,i) = real(reshape(Spar820(:,:,i).',1,[]));
    YSpar998(:,i) = real(reshape(Spar998(:,:,i).',1,[]));
    YSpar1092(:,i) = real(reshape(Spar1092(:,:,i).',1,[]));
    YSpar1093(:,i) = real(reshape(Spar1093(:,:,i).',1,[]));
    YSpar1171(:,i) = real(reshape(Spar1171(:,:,i).',1,[]));
    YSpar1271(:,i) = real(reshape(Spar1271(:,:,i).',1,[]));
    YSpar1352(:,i) = real(reshape(Spar1352(:,:,i).',1,[]));
    YSpar1511(:,i) = real(reshape(Spar1511(:,:,i).',1,[]));
    YSpar1603(:,i) = real(reshape(Spar1603(:,:,i).',1,[]));
    YSpar1629(:,i) = real(reshape(Spar1629(:,:,i).',1,[]));

    YSmooth303(:,i) = real(reshape(Smooth303(:,:,i).',1,[]));
    YSmooth378(:,i) = real(reshape(Smooth378(:,:,i).',1,[]));
    YSmooth386(:,i) = real(reshape(Smooth386(:,:,i).',1,[]));
    YSmooth797(:,i) = real(reshape(Smooth797(:,:,i).',1,[]));
    YSmooth820(:,i) = real(reshape(Smooth820(:,:,i).',1,[]));
    YSmooth998(:,i) = real(reshape(Smooth998(:,:,i).',1,[]));
    YSmooth1092(:,i) = real(reshape(Smooth1092(:,:,i).',1,[]));
    YSmooth1093(:,i) = real(reshape(Smooth1093(:,:,i).',1,[]));
    YSmooth1171(:,i) = real(reshape(Smooth1171(:,:,i).',1,[]));
    YSmooth1271(:,i) = real(reshape(Smooth1271(:,:,i).',1,[]));
    YSmooth1352(:,i) = real(reshape(Smooth1352(:,:,i).',1,[]));
    YSmooth1511(:,i) = real(reshape(Smooth1511(:,:,i).',1,[]));
    YSmooth1603(:,i) = real(reshape(Smooth1603(:,:,i).',1,[]));
    YSmooth1629(:,i) = real(reshape(Smooth1629(:,:,i).',1,[]));

end

%% Clustering

Z303_Sim = linkage(YSim303','ward');
clustersSim303 = cluster(Z303_Sim,'maxclust',2);
clustersSim303 = clustersSim303-1;

Z378_Sim = linkage(YSim378','ward');
clustersSim378 = cluster(Z378_Sim,'maxclust',2);
clustersSim378 = clustersSim378-1;

Z386_Sim = linkage(YSim386','ward');
clustersSim386 = cluster(Z386_Sim,'maxclust',2);
clustersSim386 = clustersSim386-1;

Z797_Sim = linkage(YSim797','ward');
clustersSim797 = cluster(Z797_Sim,'maxclust',2);
clustersSim797 = clustersSim797-1;

Z820_Sim = linkage(YSim820','ward');
clustersSim820 = cluster(Z820_Sim,'maxclust',2);
clustersSim820 = clustersSim820-1;

Z998_Sim = linkage(YSim998','ward');
clustersSim998 = cluster(Z998_Sim,'maxclust',2);
clustersSim998 = clustersSim998-1;

Z1092_Sim = linkage(YSim1092','ward');
clustersSim1092 = cluster(Z1092_Sim,'maxclust',2);
clustersSim1092 = clustersSim1092-1;

Z1093_Sim = linkage(YSim1093','ward');
clustersSim1093 = cluster(Z1093_Sim,'maxclust',2);
clustersSim1093 = clustersSim1093-1;

Z1171_Sim = linkage(YSim1171','ward');
clustersSim1171 = cluster(Z1171_Sim,'maxclust',2);
clustersSim1171 = clustersSim1171-1;

Z1271_Sim = linkage(YSim1271','ward');
clustersSim1271 = cluster(Z1271_Sim,'maxclust',2);
clustersSim1271 = clustersSim1271-1;

Z1352_Sim = linkage(YSim1352','ward');
clustersSim1352 = cluster(Z1352_Sim,'maxclust',2);
clustersSim1352 = clustersSim1352-1;

Z1511_Sim = linkage(YSim1511','ward');
clustersSim1511 = cluster(Z1511_Sim,'maxclust',2);
clustersSim1511 = clustersSim1511-1;

Z1603_Sim = linkage(YSim1603','ward');
clustersSim1603 = cluster(Z1603_Sim,'maxclust',2);
clustersSim1603 = clustersSim1603-1;

Z1629_Sim = linkage(YSim1629','ward');
clustersSim1629 = cluster(Z1629_Sim,'maxclust',2);
clustersSim1629 = clustersSim1629-1;

clustersSim = [clustersSim303, clustersSim378, clustersSim386, clustersSim797, clustersSim820, clustersSim998, clustersSim1092, clustersSim1093, clustersSim1171, clustersSim1271, clustersSim1352, clustersSim1511, clustersSim1603, clustersSim1629];

Z303_Pear = linkage(YPear303','ward');
clustersPear303 = cluster(Z303_Pear,'maxclust',2);
clustersPear303 = clustersPear303-1;

Z378_Pear = linkage(YPear378','ward');
clustersPear378 = cluster(Z378_Pear,'maxclust',2);
clustersPear378 = clustersPear378-1;

Z386_Pear = linkage(YPear386','ward');
clustersPear386 = cluster(Z386_Pear,'maxclust',2);
clustersPear386 = clustersPear386-1;

Z797_Pear = linkage(YPear797','ward');
clustersPear797 = cluster(Z797_Pear,'maxclust',2);
clustersPear797 = clustersPear797-1;

Z820_Pear = linkage(YPear820','ward');
clustersPear820 = cluster(Z820_Pear,'maxclust',2);
clustersPear820 = clustersPear820-1;

Z998_Pear = linkage(YPear998','ward');
clustersPear998 = cluster(Z998_Pear,'maxclust',2);
clustersPear998 = clustersPear998-1;

Z1092_Pear = linkage(YPear1092','ward');
clustersPear1092 = cluster(Z1092_Pear,'maxclust',2);
clustersPear1092 = clustersPear1092-1;

Z1093_Pear = linkage(YPear1093','ward');
clustersPear1093 = cluster(Z1093_Pear,'maxclust',2);
clustersPear1093 = clustersPear1093-1;

Z1171_Pear = linkage(YPear1171','ward');
clustersPear1171 = cluster(Z1171_Pear,'maxclust',2);
clustersPear1171 = clustersPear1171-1;

Z1271_Pear = linkage(YPear1271','ward');
clustersPear1271 = cluster(Z1271_Pear,'maxclust',2);
clustersPear1271 = clustersPear1271-1;

Z1352_Pear = linkage(YPear1352','ward');
clustersPear1352 = cluster(Z1352_Pear,'maxclust',2);
clustersPear1352 = clustersPear1352-1;

Z1511_Pear = linkage(YPear1511','ward');
clustersPear1511 = cluster(Z1511_Pear,'maxclust',2);
clustersPear1511 = clustersPear1511-1;

Z1603_Pear = linkage(YPear1603','ward');
clustersPear1603 = cluster(Z1603_Pear,'maxclust',2);
clustersPear1603 = clustersPear1603-1;

Z1629_Pear = linkage(YPear1629','ward');
clustersPear1629 = cluster(Z1629_Pear,'maxclust',2);
clustersPear1629 = clustersPear1629-1;

clustersPear = [clustersPear303, clustersPear378, clustersPear386, clustersPear797, clustersPear820, clustersPear998, clustersPear1092, clustersPear1093, clustersPear1171, clustersPear1271, clustersPear1352, clustersPear1511, clustersPear1603, clustersPear1629];

Z303_Spar = linkage(YSpar303','ward');
clustersSpar303 = cluster(Z303_Spar,'maxclust',2);
clustersSpar303 = clustersSpar303-1;

Z378_Spar = linkage(YSpar378','ward');
clustersSpar378 = cluster(Z378_Spar,'maxclust',2);
clustersSpar378 = clustersSpar378-1;

Z386_Spar = linkage(YSpar386','ward');
clustersSpar386 = cluster(Z386_Spar,'maxclust',2);
clustersSpar386 = clustersSpar386-1;

Z797_Spar = linkage(YSpar797','ward');
clustersSpar797 = cluster(Z797_Spar,'maxclust',2);
clustersSpar797 = clustersSpar797-1;

Z820_Spar = linkage(YSpar820','ward');
clustersSpar820 = cluster(Z820_Spar,'maxclust',2);
clustersSpar820 = clustersSpar820-1;

Z998_Spar = linkage(YSpar998','ward');
clustersSpar998 = cluster(Z998_Spar,'maxclust',2);
clustersSpar998 = clustersSpar998-1;

Z1092_Spar = linkage(YSpar1092','ward');
clustersSpar1092 = cluster(Z1092_Spar,'maxclust',2);
clustersSpar1092 = clustersSpar1092-1;

Z1093_Spar = linkage(YSpar1093','ward');
clustersSpar1093 = cluster(Z1093_Spar,'maxclust',2);
clustersSpar1093 = clustersSpar1093-1;

Z1171_Spar = linkage(YSpar1171','ward');
clustersSpar1171 = cluster(Z1171_Spar,'maxclust',2);
clustersSpar1171 = clustersSpar1171-1;

Z1271_Spar = linkage(YSpar1271','ward');
clustersSpar1271 = cluster(Z1271_Spar,'maxclust',2);
clustersSpar1271 = clustersSpar1271-1;

Z1352_Spar = linkage(YSpar1352','ward');
clustersSpar1352 = cluster(Z1352_Spar,'maxclust',2);
clustersSpar1352 = clustersSpar1352-1;

Z1511_Spar = linkage(YSpar1511','ward');
clustersSpar1511 = cluster(Z1511_Spar,'maxclust',2);
clustersSpar1511 = clustersSpar1511-1;

Z1603_Spar = linkage(YSpar1603','ward');
clustersSpar1603 = cluster(Z1603_Spar,'maxclust',2);
clustersSpar1603 = clustersSpar1603-1;

Z1629_Spar = linkage(YSpar1629','ward');
clustersSpar1629 = cluster(Z1629_Spar,'maxclust',2);
clustersSpar1629 = clustersSpar1629-1;

clustersSpar = [clustersSpar303, clustersSpar378, clustersSpar386, clustersSpar797, clustersSpar820, clustersSpar998, clustersSpar1092, clustersSpar1093, clustersSpar1171, clustersSpar1271, clustersSpar1352, clustersSpar1511, clustersSpar1603, clustersSpar1629];

Z303_Smooth = linkage(YSmooth303','ward');
clustersSmooth303 = cluster(Z303_Smooth,'maxclust',2);
clustersSmooth303 = clustersSmooth303-1;

Z378_Smooth = linkage(YSmooth378','ward');
clustersSmooth378 = cluster(Z378_Smooth,'maxclust',2);
clustersSmooth378 = clustersSmooth378-1;

Z386_Smooth = linkage(YSmooth386','ward');
clustersSmooth386 = cluster(Z386_Smooth,'maxclust',2);
clustersSmooth386 = clustersSmooth386-1;

Z797_Smooth = linkage(YSmooth797','ward');
clustersSmooth797 = cluster(Z797_Smooth,'maxclust',2);
clustersSmooth797 = clustersSmooth797-1;

Z820_Smooth = linkage(YSmooth820','ward');
clustersSmooth820 = cluster(Z820_Smooth,'maxclust',2);
clustersSmooth820 = clustersSmooth820-1;

Z998_Smooth = linkage(YSmooth998','ward');
clustersSmooth998 = cluster(Z998_Smooth,'maxclust',2);
clustersSmooth998 = clustersSmooth998-1;

Z1092_Smooth = linkage(YSmooth1092','ward');
clustersSmooth1092 = cluster(Z1092_Smooth,'maxclust',2);
clustersSmooth1092 = clustersSmooth1092-1;

Z1093_Smooth = linkage(YSmooth1093','ward');
clustersSmooth1093 = cluster(Z1093_Smooth,'maxclust',2);
clustersSmooth1093 = clustersSmooth1093-1;

Z1171_Smooth = linkage(YSmooth1171','ward');
clustersSmooth1171 = cluster(Z1171_Smooth,'maxclust',2);
clustersSmooth1171 = clustersSmooth1171-1;

Z1271_Smooth = linkage(YSmooth1271','ward');
clustersSmooth1271 = cluster(Z1271_Smooth,'maxclust',2);
clustersSmooth1271 = clustersSmooth1271-1;

Z1352_Smooth = linkage(YSmooth1352','ward');
clustersSmooth1352 = cluster(Z1352_Smooth,'maxclust',2);
clustersSmooth1352 = clustersSmooth1352-1;

Z1511_Smooth = linkage(YSmooth1511','ward');
clustersSmooth1511 = cluster(Z1511_Smooth,'maxclust',2);
clustersSmooth1511 = clustersSmooth1511-1;

Z1603_Smooth = linkage(YSmooth1603','ward');
clustersSmooth1603 = cluster(Z1603_Smooth,'maxclust',2);
clustersSmooth1603 = clustersSmooth1603-1;

Z1629_Smooth = linkage(YSmooth1629','ward');
clustersSmooth1629 = cluster(Z1629_Smooth,'maxclust',2);
clustersSmooth1629 = clustersSmooth1629-1;

clustersSmooth = [clustersSmooth303, clustersSmooth378, clustersSmooth386, clustersSmooth797, clustersSmooth820, clustersSmooth998, clustersSmooth1092, clustersSmooth1093, clustersSmooth1171, clustersSmooth1271, clustersSmooth1352, clustersSmooth1511, clustersSmooth1603, clustersSmooth1629];

subjects = ["303", "378", "386", "797", "820", "998", "1092", "1093", "1171", "1271", "1352", "1511", "1603", "1629"];

%% Plot

%{
figure()
subplot(2,1,1)
%if(clusters(end-1,i)==1)
plot(clustersSpar1629)
%else
%plot(1-clusters(:,i))
%end
ylim([-0.1,1.1])
title('Graph Labels')
subplot(2,1,2)
plot(1:2:2*length(scaleW),scaleW)
title('Emotion Scale')
%}
%{
for i=1:length(subjects)
    figure()
    subplot(2,1,1)
    %if(clusters(end-1,i)==1)
        plot(clusters(:,i))
    %else
        %plot(1-clusters(:,i))
    %end
    ylim([-0.1,1.1])
    title('Graph Labels')
    subplot(2,1,2)
    plot(scaleW)
    title('Emotion Scale')
    sgtitle(subjects(i))
end
%}

%% Cosine similarity

C_same_Sim = zeros(14,1);
C_inv_Sim = zeros(14,1);

for i=1:length(subjects)
    C_same_Sim(i) = (sum(clustersSim(:,i).*scaleW))/(norm(clustersSim(:,i),2)*norm(scaleW,2));
    C_inv_Sim(i) = (sum((1-clustersSim(:,i)).*scaleW))/(norm((1-clustersSim(:,i)),2)*norm(scaleW,2));
end

CSim_cosine = max(C_same_Sim,C_inv_Sim);

C_same_Pear = zeros(14,1);
C_inv_Pear = zeros(14,1);

for i=1:length(subjects)
    C_same_Pear(i) = (sum(clustersPear(:,i).*scaleW))/(norm(clustersPear(:,i),2)*norm(scaleW,2));
    C_inv_Pear(i) = (sum((1-clustersPear(:,i)).*scaleW))/(norm((1-clustersPear(:,i)),2)*norm(scaleW,2));
end

CPear_cosine = max(C_same_Pear,C_inv_Pear);

C_same_Spar = zeros(14,1);
C_inv_Spar = zeros(14,1);

for i=1:length(subjects)
    C_same_Spar(i) = (sum(clustersSpar(:,i).*scaleW))/(norm(clustersSpar(:,i),2)*norm(scaleW,2));
    C_inv_Spar(i) = (sum((1-clustersSpar(:,i)).*scaleW))/(norm((1-clustersSpar(:,i)),2)*norm(scaleW,2));
end

CSpar_cosine = max(C_same_Spar,C_inv_Spar);

C_same_Smooth = zeros(14,1);
C_inv_Smooth = zeros(14,1);

for i=1:length(subjects)
    C_same_Smooth(i) = (sum(clustersSmooth(:,i).*scaleW))/(norm(clustersSmooth(:,i),2)*norm(scaleW,2));
    C_inv_Smooth(i) = (sum((1-clustersSmooth(:,i)).*scaleW))/(norm((1-clustersSmooth(:,i)),2)*norm(scaleW,2));
end

CSmooth_cosine = max(C_same_Smooth,C_inv_Smooth);

%% Cross correlation

C_same_Sim = zeros(14,1);
C_inv_Sim = zeros(14,1);

for i=1:length(subjects)
    C_same_Sim(i) = max(abs(xcorr(clustersSim(:,i),scaleW,'coeff')));
    C_inv_Sim(i) = max(abs(xcorr(1-clustersSim(:,i),scaleW,'coeff')));
end

CSim_cross = max(C_same_Sim,C_inv_Sim);

C_same_Pear = zeros(14,1);
C_inv_Pear = zeros(14,1);

for i=1:length(subjects)
    C_same_Pear(i) = max(abs(xcorr(clustersPear(:,i),scaleW,'coeff')));
    C_inv_Pear(i) = max(abs(xcorr(1-clustersPear(:,i),scaleW,'coeff')));
end

CPear_cross = max(C_same_Pear,C_inv_Pear);

C_same_Spar = zeros(14,1);
C_inv_Spar = zeros(14,1);

for i=1:length(subjects)
    C_same_Spar(i) = max(abs(xcorr(clustersSpar(:,i),scaleW,'coeff')));
    C_inv_Spar(i) = max(abs(xcorr(1-clustersSpar(:,i),scaleW,'coeff')));
end

CSpar_cross = max(C_same_Spar,C_inv_Spar);

C_same_Smooth = zeros(14,1);
C_inv_Smooth = zeros(14,1);

for i=1:length(subjects)
    C_same_Smooth(i) = max(abs(xcorr(clustersSmooth(:,i),scaleW,'coeff')));
    C_inv_Smooth(i) = max(abs(xcorr(1-clustersSmooth(:,i),scaleW,'coeff')));
end

CSmooth_cross = max(C_same_Smooth,C_inv_Smooth);

%% DTW

C_same_Sim = zeros(14,1);
C_inv_Sim = zeros(14,1);

for i=1:length(subjects)
    a = clustersSim(:,i);
    b = scaleW;
    c = 1-clustersSim(:,i);
    C_same_Sim(i) = dtw(((a-mean(a))/(sqrt(var(a)))),((b-mean(b))/(sqrt(var(b)))));
    C_inv_Sim(i) = dtw(((c-mean(c))/(sqrt(var(c)))),((b-mean(b))/(sqrt(var(b)))));
end

CSim_dtw = max(C_same_Sim,C_inv_Sim);

C_same_Pear = zeros(14,1);
C_inv_Pear = zeros(14,1);

for i=1:length(subjects)
    a = clustersPear(:,i);
    b = scaleW;
    c = 1-clustersPear(:,i);
    C_same_Pear(i) = dtw(((a-mean(a))/(sqrt(var(a)))),((b-mean(b))/(sqrt(var(b)))));
    C_inv_Pear(i) = dtw(((c-mean(c))/(sqrt(var(c)))),((b-mean(b))/(sqrt(var(b)))));
end

CPear_dtw = max(C_same_Pear,C_inv_Pear);

C_same_Spar = zeros(14,1);
C_inv_Spar = zeros(14,1);

for i=1:length(subjects)
    a = clustersSpar(:,i);
    b = scaleW;
    c = 1-clustersSpar(:,i);
    C_same_Spar(i) = dtw(((a-mean(a))/(sqrt(var(a)))),((b-mean(b))/(sqrt(var(b)))));
    C_inv_Spar(i) = dtw(((c-mean(c))/(sqrt(var(c)))),((b-mean(b))/(sqrt(var(b)))));
end

CSpar_dtw = max(C_same_Spar,C_inv_Spar);

C_same_Smooth = zeros(14,1);
C_inv_Smooth = zeros(14,1);

for i=1:length(subjects)
    a = clustersSmooth(:,i);
    b = scaleW;
    c = 1-clustersSmooth(:,i);
    C_same_Smooth(i) = dtw(((a-mean(a))/(sqrt(var(a)))),((b-mean(b))/(sqrt(var(b)))));
    C_inv_Smooth(i) = dtw(((c-mean(c))/(sqrt(var(c)))),((b-mean(b))/(sqrt(var(b)))));
end

CSmooth_dtw = max(C_same_Smooth,C_inv_Smooth);

%% Euclidean

C_same_Sim = zeros(14,1);
C_inv_Sim = zeros(14,1);

for i=1:length(subjects)
    a = clustersSim(:,i);
    b = scaleW;
    c = 1-clustersSim(:,i);
    C_same_Sim(i) = norm(((a-mean(a))/(sqrt(var(a))))-((b-mean(b))/(sqrt(var(b)))),2);
    C_inv_Sim(i) = norm(((c-mean(c))/(sqrt(var(c))))-((b-mean(b))/(sqrt(var(b)))),2);
end

CSim_euc = max(C_same_Sim,C_inv_Sim);

C_same_Pear = zeros(14,1);
C_inv_Pear = zeros(14,1);

for i=1:length(subjects)
    a = clustersPear(:,i);
    b = scaleW;
    c = 1-clustersPear(:,i);
    C_same_Pear(i) = norm(((a-mean(a))/(sqrt(var(a))))-((b-mean(b))/(sqrt(var(b)))),2);
    C_inv_Pear(i) = norm(((c-mean(c))/(sqrt(var(c))))-((b-mean(b))/(sqrt(var(b)))),2);
end

CPear_euc = max(C_same_Pear,C_inv_Pear);

C_same_Spar = zeros(14,1);
C_inv_Spar = zeros(14,1);

for i=1:length(subjects)
    a = clustersSpar(:,i);
    b = scaleW;
    c = 1-clustersSpar(:,i);
    C_same_Spar(i) = norm(((a-mean(a))/(sqrt(var(a))))-((b-mean(b))/(sqrt(var(b)))),2);
    C_inv_Spar(i) = norm(((c-mean(c))/(sqrt(var(c))))-((b-mean(b))/(sqrt(var(b)))),2);
end

CSpar_euc = max(C_same_Spar,C_inv_Spar);

C_same_Smooth = zeros(14,1);
C_inv_Smooth = zeros(14,1);

for i=1:length(subjects)
    a = clustersSmooth(:,i);
    b = scaleW;
    c = 1-clustersSmooth(:,i);
    C_same_Smooth(i) = norm(((a-mean(a))/(sqrt(var(a))))-((b-mean(b))/(sqrt(var(b)))),2);
    C_inv_Smooth(i) = norm(((c-mean(c))/(sqrt(var(c))))-((b-mean(b))/(sqrt(var(b)))),2);
end

CSmooth_euc = max(C_same_Smooth,C_inv_Smooth);

%% Tabulate

disp('Cosine Similarity')

compare = [CSpar_cosine, CSim_cosine, CSmooth_cosine, CPear_cosine];
compare1 = sum(compare,1)/14;

T = array2table(compare,'VariableNames',{'Similarity','Sparsity','Smoothness','Pearson'});
disp(T);

T = array2table(compare1,'VariableNames',{'Similarity','Sparsity','Smoothness','Pearson'});
disp(T);

disp('Cross Correlation')

compare = [CSpar_cross, CSim_cross, CSmooth_cross, CPear_cross];
compare1 = sum(compare,1)/14;

T = array2table(compare,'VariableNames',{'Similarity','Sparsity','Smoothness','Pearson'});
disp(T);

T = array2table(compare1,'VariableNames',{'Similarity','Sparsity','Smoothness','Pearson'});
disp(T);

disp('Euclidean distance')

compare = [CSpar_euc, CSim_euc, CSmooth_euc, CPear_euc];
compare1 = sum(compare,1)/14;

T = array2table(compare,'VariableNames',{'Similarity','Sparsity','Smoothness','Pearson'});
disp(T);

T = array2table(compare1,'VariableNames',{'Similarity','Sparsity','Smoothness','Pearson'});
disp(T);

disp('DTW distance')

compare = [CSpar_dtw, CSim_dtw, CSmooth_dtw, CPear_dtw];
compare1 = sum(compare,1)/14;

T = array2table(compare,'VariableNames',{'Similarity','Sparsity','Smoothness','Pearson'});
disp(T);

T = array2table(compare1,'VariableNames',{'Similarity','Sparsity','Smoothness','Pearson'});
disp(T);

%%
%{
fig = figure();
plot(1:2:2*length(scaleW),(clustersSpar(:,end-2)-sum(clustersSpar(:,end-2))/length(clustersSpar(:,end-2)))/(sqrt(var(clustersSpar(:,end-2)))),LineWidth=2.0)
ylim([-2,3])
yticklabels('')
xL=xlim;
yL=ylim;
%text(0.99*xL(2),0.99*yL(2),'Cluster Label','HorizontalAlignment','right','VerticalAlignment','top','FontSize',20,'FontWeight','bold')
hold on
plot(1:2:2*length(scaleW),(scaleW-(sum(scaleW)/length(scaleW)))/(sqrt(var(scaleW))),LineWidth=2.0)
hold off
xlabel('Time (s)','FontSize',30,'FontWeight','bold')
legend('Cluster labels','Emotion Contagion Scale', 'FontSize', 20, 'FontWeight', 'bold');
%}
%subplot(2,1,2)
%plot(1:2:2*length(scaleW),scaleW,LineWidth=2.0)
%xlabel('Time (s)','FontSize',30,'FontWeight','bold')
%xL=xlim;
%yL=ylim;
%text(0.99*xL(2),0.99*yL(2),'Emotion Contagion','HorizontalAlignment','right','VerticalAlignment','top','FontSize',20,'FontWeight','bold')
%tightfig
%print('graphClustering_superimposed','-dpdf','-bestfit')

sig1 = (clustersSpar(:,end-2)-sum(clustersSpar(:,end-2))/length(clustersSpar(:,end-2)))/(sqrt(var(clustersSpar(:,end-2))));
sig2 = (scaleW-(sum(scaleW)/length(scaleW)))/(sqrt(var(scaleW)));
%{
figure()
plot(1:2:2*length(scaleW),sig1/max(sig1),LineWidth=2.0)
ylim([-1.5,1.2])
yticklabels('')
xL=xlim;
yL=ylim;
text(0.99*xL(2),0.99*yL(2),'Cluster labels','HorizontalAlignment','right','VerticalAlignment','top','FontSize',20,'FontWeight','bold')
xlabel('Time (s)','FontSize',30,'FontWeight','bold')
print('graphClusters','-dpdf','-bestfit')
%}

figure()
plot(sig2/max(sig2),LineWidth=2.0)
xlabel('Time (s)','FontSize',30,'FontWeight','bold')
yticklabels('')
xL=xlim;
yL=ylim;
text(0.99*xL(2),0.99*yL(2),'Emotion contagion scale','HorizontalAlignment','right','VerticalAlignment','top','FontSize',20,'FontWeight','bold')
%print('emotionScale','-dpdf','-bestfit')


%% Avg cluster labels

clustersSim_avg = 0;
clustersSpar_avg = 0;
clustersPear_avg = 0;
clustersSmooth_avg = 0;

for i=1:14
    if(C_same_Sim(i)>C_inv_Sim(i))
        clustersSim_avg = clustersSim_avg + clustersSim(:,i);
    else
        clustersSim_avg = clustersSim_avg + 1 - clustersSim(:,i);
    end

    if(C_same_Spar(i)>C_inv_Spar(i))
        clustersSpar_avg = clustersSpar_avg + clustersSpar(:,i);
    else
        clustersSpar_avg = clustersSpar_avg + 1 - clustersSpar(:,i);
    end

    if(C_same_Pear(i)>C_inv_Pear(i))
        clustersPear_avg = clustersPear_avg + clustersPear(:,i);
    else
        clustersPear_avg = clustersPear_avg + 1 - clustersPear(:,i);
    end

    if(C_same_Smooth(i)>C_inv_Smooth(i))
        clustersSmooth_avg = clustersSmooth_avg + clustersSmooth(:,i);
    else
        clustersSmooth_avg = clustersSmooth_avg + 1 - clustersSmooth(:,i);
    end
end

clustersSim_avg = clustersSim_avg/14;
clustersSpar_avg = clustersSpar_avg/14;
clustersPear_avg = clustersPear_avg/14;
clustersSmooth_avg = clustersSmooth_avg/14;

%shiftPear = [zeros(1,175),ones(1,25),zeros(1,49)]';

%save("clustersSpar","clustersSpar_avg");
%save("emotion1","scaleW");

%% Plotting

clustersSpar_avg1 = load('clustersSpar.mat').clustersSpar_avg;
scaleW1 = load('emotion1.mat').scaleW;

fig = figure();
subplot(2,1,1)
plot(1:2:2*length(scaleW1),-(clustersSpar_avg1-sum(clustersSpar_avg1)/length(clustersSpar_avg1))/(sqrt(var(clustersSpar_avg1))),LineWidth=2.0)
ylim([-3,5])
%yticklabels('')
xlabel('Time (s)','FontSize',15,'FontWeight','bold')
xL=xlim;
yL=ylim;
%text(0.99*xL(2),0.99*yL(2),'Cluster Label','HorizontalAlignment','right','VerticalAlignment','top','FontSize',20,'FontWeight','bold')
hold on
plot(1:2:2*length(scaleW1),(scaleW1-(sum(scaleW1)/length(scaleW1)))/sqrt(var(scaleW1)),LineWidth=2.0)
hold off
legend('Graph cluster labels','Emotion contagion scale','FontSize',12,'FontWeight','bold')
title('MOVIE 1')
fontsize(fig,15,"points")
subplot(2,1,2)
plot(1:2:2*length(scaleW),-(clustersSpar_avg-sum(clustersSpar_avg)/length(clustersSpar_avg))/(sqrt(var(clustersSpar_avg))),LineWidth=2.0)
ylim([-3,5])
%yticklabels('')
xlabel('Time (s)','FontSize',15,'FontWeight','bold')
xL=xlim;
yL=ylim;
%text(0.99*xL(2),0.99*yL(2),'Cluster Label','HorizontalAlignment','right','VerticalAlignment','top','FontSize',20,'FontWeight','bold')
hold on
plot(1:2:2*length(scaleW),10*(scaleW-(sum(scaleW)/length(scaleW))),LineWidth=2.0)
hold off
legend('Graph cluster labels','Emotion contagion scale','FontSize',12,'FontWeight','bold')
title('MOVIE 2')
fontsize(fig,15,"points")
pos = get(gcf, 'Position');
set(gcf, 'Position',pos+[0 -150 0 150])
print('graphClustering_superimposed_both','-dpdf','-bestfit')

%% Get all top subjects for seeds

subjects = ["303","378","386","797","820","998","1092","1093","1171","1271","1352","1511","1603","1629"];

K = 5; % Top number of subjects to be chosen

C_same_Spar = zeros(14,1);
C_inv_Spar = zeros(14,1);

for i=1:length(subjects)
    C_same_Spar(i) = max(abs(xcorr(-clustersSpar(:,i),scaleW,'coeff')));
    C_inv_Spar(i) = max(abs(xcorr(-1+clustersSpar(:,i),scaleW,'coeff')));
end

CSpar_cross = max(C_same_Spar,C_inv_Spar);

sortedCSpar_cross = sort(CSpar_cross,'descend');
threshold = sortedCSpar_cross(K+1);
indices = CSpar_cross>threshold;

topSubjects = subjects(indices);
disp(topSubjects)
%save('topSubjects.mat',"topSubjects");