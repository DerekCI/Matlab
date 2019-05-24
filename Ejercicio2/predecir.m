function p = predecir(theta, X)

m = size(X, 1); 
p = zeros(m, 1);

for i=1:m
    if (sigmoide(theta' * X(i, :)') >= 0.5)
        p(i) = 1;
    end
end

end