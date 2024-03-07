function Graphs_W = sparWindowLearnWeighted(XData,Num,lambda,N)

L = size(XData);
L = L(2);

Graphs_W = [];

for last = Num:L

    %% Starting with NULL to append further

    beta_final = [];

    %% Repeating optimization solving N times

    for j=1:N

        X = XData(:,last-Num+1:last);

        yj = X(j,:);
        X(j,:) = [];
        Yn = X;

        cvx_begin

        variable beta_hat(N-1)

        minimize(norm((yj'-Yn'*beta_hat),2) + lambda*norm(beta_hat,1))

        subject to
        beta_hat >= 0;

        cvx_end

        beta_hat = beta_hat';

        beta_final = [beta_final;[beta_hat(1:N-1 < j),0,beta_hat(1:N-1 >= j)]];

    end

    %% Making it symmetric

    W = zeros(N,N);

    for i=1:N
        for j=1:N
            W(i,j) = sqrt(beta_final(i,j)*beta_final(j,i));
        end
    end

    %% Normalize Adjacency

    W = normAdj(W);

    Graphs_W = [Graphs_W,W];

end

Graphs_W = reshape(Graphs_W,N,N,L-Num+1);

end
