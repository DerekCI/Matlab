
function [theta, J_history] = gradiente_descendente(X, y, theta, alpha, lambda, num_iterations)
    
    m = size(X, 1);
    J_history = zeros(num_iterations, 1);

    for iteration = 1:num_iterations
        theta = optimizacion(X, y, theta, alpha, lambda);
        J_history(iteration) = Costo(X, y, theta, lambda);
    end
end