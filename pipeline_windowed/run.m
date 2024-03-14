clc
clear
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Common for all subjects

%{
cd extract_data\
extractLayout
extractLabels
%}

%% Run over all subjects

% cd ..
subjects = ["303","378","386","797","820","998","1092","1093","1171","1271","1352","1511","1603","1629"];

for i = 1:length(subjects) 
    subject = subjects(i);
    
    %{
    %% Extraction

    cd extract_data\
    extractData(subject)
    
    %% Normalize

    cd ..
    cd normalize_data\
    normalizeData(subject)
    
    %% HPF

    optionHPF = 'LS'; % Or 'EQ'

    cd ..
    cd hpf\
    highPassFiltering(optionHPF,subject);

    %% Clustering

    option1Clustering = 'KM'; % Or 'ISRM'
    option2Clustering = 3; % Or 0.5

    cd ..
    cd clustering\
    clustering(option1Clustering,option2Clustering,subject);
    
    %% Combination

    optionCombination = 'SA'; % Or 'WA'

    cd ..
    
    cd combination\
    combining(optionCombination,subject);

    cd ..
    %}
    
    %% Graph Learning

    windowSize = 8;

    sigma_similarity = 1; % For similarity based learning

    alpha_smoothness = 0.25; % For smoothness based learning
    beta_smoothness = 9; % For smoothness based learning
    iter_smoothness = 20; % For smoothness based learning

    lambda_sparsity = 2.5; % For sparsity based learning

    %cd graph_learning\
    %{   
    optionLearning = 'SI';
    learn(windowSize,optionLearning,sigma_similarity,alpha_smoothness,beta_smoothness,iter_smoothness,lambda_sparsity,subject);
    
    optionLearning = 'PE';
    learn(windowSize,optionLearning,sigma_similarity,alpha_smoothness,beta_smoothness,iter_smoothness,lambda_sparsity,subject);
    
    optionLearning = 'SP';
    learn(windowSize,optionLearning,sigma_similarity,alpha_smoothness,beta_smoothness,iter_smoothness,lambda_sparsity,subject);
    
    optionLearning = 'SM';
    learn(windowSize,optionLearning,sigma_similarity,alpha_smoothness,beta_smoothness,iter_smoothness,lambda_sparsity,subject);
    %}
    
    cd normalize_graphs\
    normalizeGraphs(subject);
    
    cd ..
    
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc