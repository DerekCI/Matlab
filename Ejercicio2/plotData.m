    
function plotData(X, y)

figure; hold on;

positiveClassIndices = find(y == 1);
negativeClassIndices = find(y == 0);

plot(X(positiveClassIndices, 1), X(positiveClassIndices, 2), 'g+', 'LineWidth', 2, ...
    'MarkerSize', 7);
plot(X(negativeClassIndices, 1), X(negativeClassIndices, 2), 'ro', 'LineWidth', 2, ...
    'MarkerSize', 7);

hold off;

end