clc
clear

%% Define parameters
N = 20; % Number of nodes
p = 0.2; % Edge probability for Erdos-Renyi graph
alpha = 0.25; % Weight for smoothness term
beta = 9; % Weight for Laplacian regularization term
gamma = 0.1; % Weight for graph similarity term
T = 100; % Number of observations
iter = 10; % Number of iterations

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

%% Initialize Y
Y = X;

%% Single iteration
cvx_begin
variable L_hat(N, N) symmetric
variable A_hat(N, N) symmetric
minimize(square_pos(norm(X - A_hat * X, 'fro')) + alpha * trace(X' * A_hat' * L_hat * A_hat * X) + beta * square_pos(norm(L_hat, 'fro')))
subject to
sum(L_hat, 1).' == zeros(N, 1); % Row sums of L_hat = 0
L_hat == L_hat.'; % L_hat is symmetric
trace(L_hat) == N; % Trace of L_hat = N
L_hat == semidefinite(N); % L_hat is positive semidefinite
L_hat - diag(diag(L_hat)) <= 0; % Non-diagonal entries <= 0
A_hat == diag(diag(L_hat)) - L_hat; % Relating A_hat and L_hat
A_hat == A_hat';
cvx_end

%% Obtain learnt adjacency matrix
hat_W = abs(L_hat - diag(diag(L_hat))) > 1e-4; % Threshold non-diagonal entries

% Plotting adjacency matrices
figure()
subplot(1, 2, 1);
imagesc(W);
title('Original');

subplot(1, 2, 2);
imagesc(hat_W);
title('Learnt');