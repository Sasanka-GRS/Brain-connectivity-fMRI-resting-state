function Graphs_W = pearWindowLearnWeighted(XData,Num,N)

L = size(XData);
L = L(2);

Graphs_W = zeros(N,N,L-Num+1);

start = 1;
last = Num;

while(last <= L)

    %% Windowing data

    X = XData(:,start:last);

    %% Setting weights as correlation coefficients
    
    W = corrcoef(X');

    %% Set diagonals to zeros

    W = W - eye(N);

    W = abs(W);

    W = normAdj(W);
    
    Graphs_W(:,:,start) = W;

    start = start + 1;
    last = last  + 1;

end

end