function y = thres_signal(x,k)

x1 = real(x);
S = sort(x1,'descend');
val = S(k);
y = x1;
y(x1>val) = 1;
y(x1<val) = 0;

end