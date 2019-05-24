function [cost] = Costo(X, y, theta, lambda)
   
    m = size(X, 1);
    differences = hypothesis(X, theta) - y;
    
    theta_cut = theta(2:end, 1);
    regularization_param = lambda * (theta_cut' * theta_cut);

    cost = (1 / 2 * m) * (differences' * differences + regularization_param);
end