function learn(windowSize,option,sigma_similarity,alpha_smoothness,beta_smoothness,iter_smoothness,lambda_sparsity,subject)

%% Set default parameters

if(nargin==0)
    windowSize = 8;
    option = 'SI';
    sigma_similarity = 1;
end

%% Add dependencies

addpath(".\functions");

%% Learning

if(strcmp(option,'SM'))
    smoothness(windowSize,alpha_smoothness,beta_smoothness,iter_smoothness,subject);
elseif(strcmp(option,'PE'))
    pearson(windowSize,subject);
elseif(strcmp(option,'SP'))
    sparsity(windowSize,lambda_sparsity,subject);
else
    similarity(windowSize,sigma_similarity,subject);
end

end