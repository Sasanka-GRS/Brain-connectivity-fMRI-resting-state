function Graphs_W = pearWindowLearnWeighted(XData,N)

%% Whole data

X = XData;

%% Setting weights as correlation coefficients

W = corrcoef(X');

%% Set diagonals to zeros

W = W - eye(N);

W = abs(W);

W = normAdj(W);

Graphs_W = W;

end