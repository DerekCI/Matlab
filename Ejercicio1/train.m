
function [theta,mu,sigma,X_normalized,J_history] = train(X, y, alpha, lambda, num_iterations)
   
    m = size(y, 1);

    n = size(X, 2);

    [X_normalized, mu, sigma] = prepos(X);

    X_normalized = [ones(m, 1), X_normalized];

    initial_theta = zeros(n + 1, 1);

    [theta, J_history] = gradiente_descendente(X_normalized, y, initial_theta, alpha, lambda, num_iterations);
end