function [X_normalized, mu, sigma] = prepos(X)
    X_normalized = X;
    mu = zeros(1, size(X_normalized, 2));
    sigma = zeros(1, size(X_normalized, 2));

    mu = mean(X_normalized);

    sigma = std(X_normalized);

    X_normalized = X_normalized - mu;
    X_normalized = X_normalized ./ sigma;
end