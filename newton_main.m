% newton_main.m
% Script principal que conecta cálculo y visualización

% Asesor: Claudio Hiram Carmona Jurado
% Alumno: Jonathan Meixueiro
% Matrícula: 240694

% Definir función y derivada
f = @(x) cos(x) - x.^3;
df = @(x) -sin(x) - 3*x.^2;

% Parámetros del método
x0 = 0.5;
tol = 1e-8;
maxIter = 50;

% Ejecutar cálculo
[root, iteraciones, f] = newton_raphson(f, df, x0, tol, maxIter);

% Visualizar resultados
graficar_resultado(f, root, iteraciones);

