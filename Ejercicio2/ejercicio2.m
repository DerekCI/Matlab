clear ; 
close all; 
clc;

data = load('regresion_logistica.csv');
X = data(:, [1, 2]);
y = data(:, 3);


plotData(X, y);

hold on;
xlabel('X1')
ylabel('X2')

hold off;



[m, n] = size(X);

X = [ones(m, 1) X];

initial_theta = zeros(n + 1, 1);

[cost, grad] = Costo(initial_theta, X, y);

fprintf('Costo en theta inicial (zeros): %f\n', cost);
fprintf('Gradiente en theta inicial (zeros): \n');
fprintf(' %f \n', grad);



options = optimset('GradObj', 'on', 'MaxIter', 400);

[theta, cost] = ...
	fminunc(@(t)(Costo(t, X, y)), initial_theta, options);

fprintf('Costo de theta encontrado por fminunc: %f\n', cost);
fprintf('theta: \n');
fprintf(' %f \n', theta);


plot2(theta, X, y);


hold on;

xlabel('X1')
ylabel('X2')


legend('Admitido', 'No admitido')
hold off;


prob = sigmoide([1 45 85] * theta);
fprintf(['Prob: %f\n\n'], prob);

p = predecir(theta, X);

fprintf('Exactitud de entrenamiento : %f\n', mean(double(p == y)) * 100);
