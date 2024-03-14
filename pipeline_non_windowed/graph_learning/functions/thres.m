function [Adj,W,top] = thres(A,k,Num)

%% Remove very small values

A(abs(A)<1e-12)=0;

%% Take only real part

A = real(A);

%% Take Upper Triangle

P = triu(A,1);

%% Sort

S = sort(reshape(P.',1,[]),'descend');

%% Taking the k-th Value

val = S(k);

%% Find the first non-zero value

K = k-1;
while val==0 && K>0
    val = S(K);
    K = K-1;
end

%% Thresholding

W = A;
W(A<val) = 0;

Adj = A;
Adj(A<val) = 0;
Adj(A>=val) = 1;

%% Finding top Num of values

top = A;
val1 = S(Num);
top(A<val1) = 0;
top(A>=val1) = 1;

end