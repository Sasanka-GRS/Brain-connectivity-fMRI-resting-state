function Graphs_W = smoothWindowLearnWeighted(XData,alpha,beta,iter)

% alpha increases smoothness of learnt data
% beta increases sparsity of learnt graph

%% Start with Z_est as original data

X = XData;

W = smoothWindowInside(iter,alpha,beta,X);

Graphs_W = W;

end