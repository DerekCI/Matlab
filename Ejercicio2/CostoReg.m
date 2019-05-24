function [J, grad] = CostoReg(theta, X, y, lambda)

m = length(y); 

[J, grad] = Costo(theta, X, y);
thetaSquaredSummation = 0;
for i=2:size(theta)
    thetaSquaredSummation = thetaSquaredSummation + theta(i)^2;
    grad(i) = grad(i) + (lambda / m) * theta(i);
end
J = J + (lambda / (2*m)) * thetaSquaredSummation;

end