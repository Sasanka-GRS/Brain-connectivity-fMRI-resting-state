clc
clear

%% Set parameters

cutoff1 = 0;
cutoff2 = 0;
option = 'MED'; % 'MED' for choosing the middle value and 'AVG' for averaging the window

node = load("..\extract_data\nodeLabels.mat").names;
layout = load("..\extract_data\nodeLayout.mat").locs;

%% Run loop for all subjects

subjects = ["303","378","386","820","1092","1093","1171","1352","1511","1629"];

for i = 1:length(subjects)
    subject = subjects(i);

    %% Load data

    s1 = "..\normalize_graphs\normalized_graphs\";
    s2 = "_normalizedGraphs_RS.mat";
    sub = s1 + subject + s2;

    graphOut = load(sub).graphOut;
    SimSub = graphOut.Sim;
    SparSub = graphOut.Spar;
    PearSub = graphOut.Pear;
    SmoothSub = graphOut.Smooth;

    s1 = "..\combination\combined_data\";
    s2 = "_data_combined_RS.mat";
    sub = s1 + subject + s2;

    DataSub = load(sub).data;
    DataSub = DataSub';

    %% Set parameters

    S = size(DataSub);
    N = S(1);
    T = S(2);

    %% LPF

    cutoff1 = 0;
    cutoff2 = floor(N/3);

    LPFSimSub = graphSpectralFilter(DataSub,SimSub,cutoff1,cutoff2,option);
    LPFSparSub = graphSpectralFilter(DataSub,SparSub,cutoff1,cutoff2,option);
    LPFPearSub = graphSpectralFilter(DataSub,PearSub,cutoff1,cutoff2,option);
    LPFSmoothSub = graphSpectralFilter(DataSub,SmoothSub,cutoff1,cutoff2,option);

    %% BPF

    cutoff1 = floor(N/3)+1;
    cutoff2 = 2*floor(N/3);

    BPFSimSub = graphSpectralFilter(DataSub,SimSub,cutoff1,cutoff2,option);
    BPFSparSub = graphSpectralFilter(DataSub,SparSub,cutoff1,cutoff2,option);
    BPFPearSub = graphSpectralFilter(DataSub,PearSub,cutoff1,cutoff2,option);
    BPFSmoothSub = graphSpectralFilter(DataSub,SmoothSub,cutoff1,cutoff2,option);

    %% HPF

    cutoff1 = 2*floor(N/3);
    cutoff2 = N;

    HPFSimSub = graphSpectralFilter(DataSub,SimSub,cutoff1,cutoff2,option);
    HPFSparSub = graphSpectralFilter(DataSub,SparSub,cutoff1,cutoff2,option);
    HPFPearSub = graphSpectralFilter(DataSub,PearSub,cutoff1,cutoff2,option);
    HPFSmoothSub = graphSpectralFilter(DataSub,SmoothSub,cutoff1,cutoff2,option);

    %% Save

    s1 = "gft\";
    s2 = "_GFTFiltered_RS.mat";
    sub = s1 + subject + s2;

    Sim.LPF = LPFSimSub;
    Sim.BPF = BPFSimSub;
    Sim.HPF = HPFSimSub;

    Spar.LPF = LPFSparSub;
    Spar.BPF = BPFSparSub;
    Spar.HPF = HPFSparSub;

    Pear.LPF = LPFPearSub;
    Pear.BPF = BPFPearSub;
    Pear.HPF = HPFPearSub;

    %Smooth.LPF = LPFSmoothSub;
    %Smooth.BPF = BPFSmoothSub;
    %Smooth.HPF = HPFSmoothSub;

    save(sub,"Sim","Pear","Spar");
end

%% Display
%{
figure()
subplot(3,4,1)
plotting_signal(layout,LPFSimSub,node);
title('Similarity LPF')
subplot(3,4,2)
plotting_signal(layout,LPFSparSub,node);
title('Sparsity LPF')
subplot(3,4,3)
plotting_signal(layout,LPFPearSub,node);
title('Pearson LPF')
subplot(3,4,4)
plotting_signal(layout,LPFSmoothSub,node);
title('Smoothness LPF')

subplot(3,4,5)
plotting_signal(layout,BPFSimSub,node);
title('Similarity BPF')
subplot(3,4,6)
plotting_signal(layout,BPFSparSub,node);
title('Sparsity BPF')
subplot(3,4,7)
plotting_signal(layout,BPFPearSub,node);
title('Pearson BPF')
subplot(3,4,8)
plotting_signal(layout,BPFSmoothSub,node);
title('Smoothness BPF')

subplot(3,4,9)
plotting_signal(layout,HPFSimSub,node);
title('Similarity HPF')
subplot(3,4,10)
plotting_signal(layout,HPFSparSub,node);
title('Sparsity HPF')
subplot(3,4,11)
plotting_signal(layout,HPFPearSub,node);
title('Pearson HPF')
subplot(3,4,12)
plotting_signal(layout,HPFSmoothSub,node);
title('Smoothness HPF')
%}