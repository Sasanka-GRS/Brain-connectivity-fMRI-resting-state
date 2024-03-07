function learn(windowSize,option,sigma_similarity,alpha_smoothness,beta_smoothness,iter_smoothness,lambda_sparsity,subject)

%% Set default parameters

if(nargin==0)
    windowSize = 8;
    option = 'SI';
    sigma_similarity = 1;
end

%% Add dependencies

addpath(".\functions");

%% Read structural matrix and eigendecompose

A_structural = load('..\data\structural.mat').A;
D_structural = diag(sum(A_structural,1));
L_structural = D_structural - A_structural;

[V,~] = eig(L_structural);

%% Learning

if(strcmp(option,'SM'))
    smoothness(windowSize,alpha_smoothness,beta_smoothness,iter_smoothness,subject,L_structural);
elseif(strcmp(option,'PE'))
    pearson(windowSize,subject,V);
elseif(strcmp(option,'SP'))
    sparsity(windowSize,lambda_sparsity,subject,L_structural);
else
    similarity(windowSize,sigma_similarity,subject,V);
end

end