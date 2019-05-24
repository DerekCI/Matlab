
clear ; close all; clc


data = load('regresion_logistica.csv');
X = data(:, [1, 2]); y = data(:, 3);

plotData(X, y);

hold on;

xlabel('x1')
ylabel('x2')


legend('y = 1', 'y = 0')
hold off;



X = mapFeature(X(:,1), X(:,2));

initial_theta = zeros(size(X, 2), 1);

lambda = 1;


[cost, grad] = CostoTeg(initial_theta, X, y, lambda);

fprintf('Costo en theta inicial (zeros): %f\n', cost);



initial_theta = zeros(size(X, 2), 1);

lambda = 1;

options = optimset('GradObj', 'on', 'MaxIter', 400);

[theta, J, exit_flag] = ...
	fminunc(@(t)(CostoReg(t, X, y, lambda)), initial_theta, options);


plot2(theta, X, y);
hold on;
title(sprintf('lambda = %g', lambda))

xlabel('x1')
ylabel('x2')

legend('y = 1', 'y = 0', 'Plot 2')
hold off;

p = predecir(theta, X);

fprintf('Exactitud de Entrenamiento: %f\n', mean(double(p == y)) * 100);

