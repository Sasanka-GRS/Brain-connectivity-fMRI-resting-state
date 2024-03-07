function Graphs_W = simWindowLearnWeighted(XData,sigma,N)

%% Total data

x = XData;

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

Graphs_W = W;

end