function y = dataNormVoxel(x)
y = x;
fNames = fieldnames(x);
L = length(fieldnames(x));
for i = 1:L
    xi = x.(fNames{i});
    yi = xi;
    l = size(xi);
    for k = 1:l(2)

        x1 = xi(:,k);
        mean = sum(x1)/l(1);
        %{
        v = var(x1); % Use inbuilt
        Y = (x1-mean)/sqrt(v);
        %}
        Y = x1-mean;
        yi(:,k) = Y;
    end
    y.(fNames{i}) = yi;
end
end