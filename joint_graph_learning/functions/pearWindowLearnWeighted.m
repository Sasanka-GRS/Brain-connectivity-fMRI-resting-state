function Graphs_W = pearWindowLearnWeighted(XData,Num,N,V)

% V is the eigenvector matrix of structural connectivity Laplacian

L = size(XData);
L = L(2);

Graphs_W = zeros(N,N,L-Num+1);

start = 1;
last = Num;

while(last <= L)

    %% Windowing data

    X = XData(:,start:last);

    %% LPF this data with structural graph

    H = zeros(N,1);
    H(1:floor(N/3)) = ones(floor(N/3),1);

    X_hat = V'*X;
    X_hat_f = X_hat.*H;
    X = V*X_hat_f;

    %% Setting weights as correlation coefficients
    
    W = corrcoef(X');

    W = normAdj(W);
    
    Graphs_W(:,:,start) = W;

    start = start + 1;
    last = last  + 1;

end

end