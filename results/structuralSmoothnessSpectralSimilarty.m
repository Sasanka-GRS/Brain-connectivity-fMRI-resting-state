clc
clear

%% Define parameters
N = 90; % Number of nodes
p = 0.2; % Edge probability for Erdos-Renyi graph
alpha = 0.25; % Weight for smoothness term
beta = 9; % Weight for Laplacian regularization term
gamma = 0.1; % Weight for graph similarity term
T = 100; % Number of observations
iter = 10; % Number of iterations

%% Read structural matrix
A_structural = load('structural.mat').A;
D_structural = diag(sum(A_structural,1));
L_structural = D_structural - A_structural;

%% Generate Erdos-Renyi graph
W = rand(N) < p;
W = triu(W, 1); % Upper triangular part for symmetry
W = W + W.'; % Make symmetric
W = W - diag(diag(W)); % Remove diagonal entries
W = W*N/sum(sum(W)); % Making trace(L) = N

%% Generate graph Laplacian
D = diag(sum(W, 1));
L = D - W;

%% Generate data X
Lplus = pinv(L);
X = mvnrnd(zeros(N, 1), Lplus + 0.25 * eye(N), T);
X = X';

%% LPF this data with structural graph
[V,~] = eig(L_structural);

H = zeros(N,1);
H(1:floor(N/3)) = ones(floor(N/3),1);

X_hat = V'*X;
X_hat_f = X_hat.*H;
X = V*X_hat_f;

%% Initialize Y
Y = X;

%% Perform iterations
for i = 1:iter
    % Solve for L_hat
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
    
    % Solve for Y_hat
    Y_hat = (eye(N) + alpha * L_hat) \ X;

    Y = Y_hat;
end

%% Obtain learnt adjacency matrix
hat_W = abs(L_hat - diag(diag(L_hat))) > 1e-4; % Threshold non-diagonal entries

Y = X;

%% Perform iterations with structural similarity constraint
for i = 1:iter
    % Solve for L_hat
    cvx_begin
        variable L_hat(N, N) symmetric
        minimize(alpha * trace(Y' * L_hat * Y) + beta * square_pos(norm(L_hat, 'fro')) + gamma * trace(L_hat.*L_structural))
        subject to
            sum(L_hat, 1).' == zeros(N, 1); % Row sums of L_hat = 0
            L_hat == L_hat.'; % L_hat is symmetric
            trace(L_hat) == N; % Trace of L_hat = N
            L_hat == semidefinite(N); % L_hat is positive semidefinite
            L_hat - diag(diag(L_hat)) <= 0; % Non-diagonal entries <= 0
    cvx_end
    
    % Solve for Y_hat
    Y_hat = (eye(N) + alpha * L_hat) \ X;

    Y = Y_hat;
end

%% Obtain learnt adjacency matrix
hat_W_s = abs(L_hat - diag(diag(L_hat))) > 1e-4; % Threshold non-diagonal entries

% Plotting adjacency matrices
figure()
subplot(1, 2, 1);
imagesc(hat_W);
title('Graph Adjacency without structural');

subplot(1, 2, 2);
imagesc(hat_W_s);
title('Graph Adjacency with structural');