function Graphs_W = simWindowLearnWeighted(XData,Num,sigma,N)

L = size(XData);
L = L(1);

Graphs_W = zeros(N,N,L-Num+1);

start = 1;
last = Num;

while(last <= L)
    
    %% Windowing data

    xN = XData(start:last,:);
    x = xN;

    %% LPF this data with structural graph

    H = zeros(N,1);
    H(1:floor(N/3)) = ones(floor(N/3),1);

    X_hat = V'*x;
    X_hat_f = X_hat.*H;
    x = V*X_hat_f;

    W = zeros(N,N);

    %% Setting weights as exponential distances

    for i = 1:N
        for j = 1:N
            if(i==j)
                continue;
            end
            W(i,j) = exp(-(norm(x(:,i)-x(:,j),2))/(2*(sigma^2)));
        end
    end

    %% Normalize Adjacency

    W = normAdj(W);

    Graphs_W(:,:,start) = W;
    
    start = start + 1;
    last = last  + 1;

end

end