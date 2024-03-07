function Y = graphSpectralFilter(X,W,cutoff1,cutoff2,choice)

%% Eigendecomposition

D = diag(sum(W,1));
L = D-W;

[U,~] = eig(L);

%% GFT

S = size(X);
N = S(1);
T = S(2);

X_hat = X;

for i = 1:T
    X_hat(:,i) = (U')*X(:,i);
end

%% Filtering

if(cutoff1==0)
    h = [ones(cutoff2,1); zeros(N-cutoff2,1)];
elseif(cutoff2==N)
    h = [zeros(cutoff1,1); ones(N-cutoff1,1)];
else
    h = [zeros(cutoff1,1); ones(cutoff2-cutoff1,1); zeros(N-cutoff2,1)];
end

Y_hat = h.*X_hat;

%% Inverse GFT

Y = Y_hat;

for i = 1:T
    Y(:,i) = U*Y_hat(:,i);
end

%% Choose between average and median

if(strcmp(choice,'MED'))
    Y = Y(:,round(T/2));
else
    Y = sum(Y,2)/T;
end

end