function [W,top] = thres1(A,k,Num)
A1 = A;
A(abs(A)<1e-12)=0;
A = real(A);
N = size(A);
N = N(1);
P = triu(A,1);
S = sort(reshape(P.',1,[]),'descend'); % symmetric, upper triangle
%T = S;
%S(abs(T)<1e-12) = 0;
val = S(k);
K = k-1;
while val==0 && K>0
    val = S(K);
    K = K-1;
end
W = A;
W(A>=val) = 1;
W(A<val) = 0;

top = A;
val1 = S(Num);
top(A<val1) = 0;
top(A>=val1) = 1;

nonZero = nnz(A);
%disp('nonZero are');
%disp(nonZero);
if(isequal(W-W',zeros(N)))
    %disp('It is symmetric')
else
    A1 = sqrt(A*(A'));
    N = size(A1);
    N = N(1);
    P = triu(A1,1);
    S = sort(reshape(P.',1,[]),'descend'); % symmetric, upper triangle
    T = S;
    S(abs(T)<1e-7) = 0;
    val = S(k);
    W = A1;  % Check symmetry
    W(A1>=val) = 1;
    W(A1<val) = 0;

    nonZero = nnz(W);
    %disp('nonZero are');
    %disp(nonZero);
    if(isequal(W-W',zeros(N)))
        %disp('It is symmetric1')
    else
        disp('It is not symmetric1')
    end
end

end