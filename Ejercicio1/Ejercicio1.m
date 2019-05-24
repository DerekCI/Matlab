clear; 
close all; 
clc;


data = load('linear_data.csv');

% Split data into features and results.
X = data(:, 1:2);
y = data(:, 3);


subplot(2, 2, 1);
scatter3(X(:, 1), X(:, 2), y, [], y(:), 'o');
title('Training Set');
xlabel('X');
ylabel('Y');
zlabel('Index');

lambda = 0;
alpha = 0.1;
num_iterations = 50;
[theta, mu, sigma, X_normalized, J_history] = train(X, y, alpha, lambda, num_iterations);

fprintf(' Costo inicial %f\n', J_history(1));
fprintf(' Costo optimizado %f\n', J_history(end));

fprintf(' Theta normalizado:\n');
fprintf(' %f\n', theta);
fprintf('\n');

fprintf('Usando ecuacion normal...\n');

X_normal = [ones(size(X, 1), 1) X];
theta_normal = ecuacion_normal(X_normal, y);
normal_cost = Costo(X_normal, y, theta_normal, lambda);

fprintf('Costo funcion normal %f\n', normal_cost);

fprintf('Theta sin normalizar:\n');
fprintf(' %f\n', theta_normal);
fprintf('\n');


subplot(2, 2, 2);

scatter3(X_normalized(:, 2), X_normalized(:, 3), y, [], y(:), 'o');
title('Training Set Normalizado');
xlabel('X Normalizado');
ylabel('Y Normalizado');
zlabel('index');

subplot(2, 2, 3);

plot(1:num_iterations, J_history);
xlabel('Iteracion');
ylabel('J(\theta)');
title('Progreso Gradiente Descendente ');

fprintf('Plano de hipotesis training set...\n\n');

apt_x= X_normalized(:, 2);
apt_y= X_normalized(:, 3);
apt_x_range = linspace(min(apt_x), max(apt_x), 10);
apt_y_range = linspace(min(apt_y), max(apt_y), 10);

apt_index = zeros(length(apt_x_range), length(apt_y_range));
for apt_y_index = 1:length(apt_x_range)
    for apt_y_index = 1:length(apt_y_range)
        X = [1, apt_x_range(apt_x_index), apt_x_range(apt_y_index)];
        apt_index(apt_x_index, apt_y_index) = Hipotesis(X, theta);
    end
end

subplot(2, 2, 2);
hold on;
mesh(apt_x_range, apt_y_range, apt_index);
hold off;