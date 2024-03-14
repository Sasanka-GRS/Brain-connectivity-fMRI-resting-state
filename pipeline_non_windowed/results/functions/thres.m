function W = thres(A,k)

P = triu(A,1);
S = sort(reshape(P.',1,[]),'descend'); % symmetric, upper triangle

val = S(k);

W = A;
W(A>=val) = 1;
W(A<val) = 0;

end