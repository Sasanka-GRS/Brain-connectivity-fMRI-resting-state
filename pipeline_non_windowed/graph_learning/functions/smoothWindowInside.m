function W = smoothWindowInside(iter,alpha,beta,X)

S = size(X);
N = S(1);

Y = X;

%% Perform iterations

prevOptVal = Inf;

for i = 1:iter

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%% Solve for L_hat %%%%%%%%%%%%%%%%%%%%%%%%%
    cvx_begin

    variable L_hat(N, N) symmetric

    minimize(alpha * trace(Y' * L_hat * Y) + beta * square_pos(norm(L_hat, 'fro')))

    subject to
    sum(L_hat, 1).' == zeros(N, 1); % Row sums of L_hat = 0
    L_hat == L_hat.'; % L_hat is symmetric
    trace(L_hat) == N; % Trace of L_hat = N
    L_hat == semidefinite(N); % L_hat is positive semidefinite
    L_hat - diag(diag(L_hat)) <= 0; % Non-diagonal entries <= 0

    cvx_end

    if(abs(cvx_optval-prevOptVal)<1e-4)
        break;
    end

    prevOptVal = cvx_optval;

    % Solve for Y_hat
    Y_hat = (eye(N) + alpha * L_hat) \ X;

    Y = Y_hat;
end

%% Find W from L

W = diag(diag(L_hat)) - L_hat;
W = normAdj(W);

end