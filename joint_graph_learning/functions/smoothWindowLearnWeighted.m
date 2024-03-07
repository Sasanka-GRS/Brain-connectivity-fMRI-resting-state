function Graphs_W = smoothWindowLearnWeighted(XData,Num,alpha,beta,iter,N)

% alpha increases smoothness of learnt data
% beta increases sparsity of learnt graph
L = size(XData);
L = L(2);

Graphs_W = [];

for last = Num:L

    %% Start with Z_est as original data

    X = XData(:,last-Num+1:last);
    L_est = zeros(N,N);

    W = smoothWindowInside(iter,L_est,alpha,beta,X);
    
    Graphs_W = [Graphs_W,W];

end

Graphs_W = reshape(Graphs_W,N,N,L-Num+1);

end