function learn(option,sigma_similarity,alpha_smoothness,beta_smoothness,iter_smoothness,lambda_sparsity,subject)

%% Set default parameters

if(nargin==0)
    option = 'SI';
    sigma_similarity = 1;
end

%% Add dependencies

addpath(".\functions");

%% Learning

if(strcmp(option,'SM'))
    smoothness(alpha_smoothness,beta_smoothness,iter_smoothness,subject);
elseif(strcmp(option,'PE'))
    pearson(subject);
elseif(strcmp(option,'SP'))
    sparsity(lambda_sparsity,subject);
else
    similarity(sigma_similarity,subject);
end

end