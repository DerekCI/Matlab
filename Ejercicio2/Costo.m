function [J, grad] = Costo(theta, X, y)



numberOfTrainingExamples = length(y);
costSummation = 0;
for i=1:numberOfTrainingExamples
    costSummation = costSummation - y(i)*log(sigmoid(theta' * X(i, :)')) ...
        - (1 - y(i))*log(1 - sigmoid(theta' * X(i, :)'));
end
J = (1 / numberOfTrainingExamples) * costSummation;

grad = zeros(size(theta));
for j=1:size(theta)
    for i=1:numberOfTrainingExamples
        grad(j) = grad + (sigmoid(theta' * X(i, :)') - y(i)) * X(i, j);
    end
end
grad = grad / numberOfTrainingExamples;

end