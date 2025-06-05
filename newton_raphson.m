% Asesor: Claudio Hiram Carmona Jurado
% Alumno: Jonathan Meixueiro
% Matrícula: 240694

% MÉTODO DE NEWTON-RAPHSON CON VISUALIZACIÓN DETALLADA

% === 1. DEFINICIÓN DE FUNCIÓN Y DERIVADA ===
% Función objetivo f(x) y su derivada f'(x)
f = @(x) cos(x) - x.^3;
df = @(x) -sin(x) - 3*x.^2;

% === 2. PARÁMETROS INICIALES ===
x0 = 0.5;            % Valor inicial
tol = 1e-8;          % Tolerancia para detener iteraciones
maxIter = 50;        % Número máximo de iteraciones

% === 3. INICIALIZACIÓN ===
x = x0;              % Primer valor de x
iteraciones = x0;    % Vector para almacenar cada iteración

% === 4. MÉTODO DE NEWTON-RAPHSON ===
for k = 1:maxIter
    fx = f(x);
    dfx = df(x);

    % Verificamos que la derivada no sea muy cercana a cero
    if abs(dfx) < eps
        error('Derivada cercana a cero en iteración %d', k);
    end

    % Cálculo del nuevo valor
    x_new = x - fx/dfx;
    iteraciones(end+1) = x_new;  % Guardamos el nuevo valor

    % Verificamos la convergencia
    if abs(x_new - x) < tol
        root = x_new;
        printf('Converge en %d iteraciones.\n', k);
        printf('Raíz aproximada: %.10f\n', root);
        break;
    end

    x = x_new;
end

% Si no converge
if k == maxIter
    error('No converge después de %d iteraciones.', maxIter);
end

% === 5. VISUALIZACIÓN ===
x_vals = linspace(0, 1.2, 1000);  % Rango para graficar
y_vals = f(x_vals);              % Valores de f(x)

figure;
hold on;

% === DEFINICIÓN DE COLORES PERSONALIZADOS ===
naranja = [1, 0.5, 0];     % Color naranja para iteraciones
rojo    = [1, 0, 0];       % Color rojo para la raíz final
gris    = [0.5 0.5 0.5];   % Gris para líneas guía

% === GRAFICAR LA FUNCIÓN ===
h_func = plot(x_vals, y_vals, 'b-', 'LineWidth', 2);

% === EJES PUNTEADOS ===
h_xaxis = plot(x_vals, zeros(size(x_vals)), 'k--', 'LineWidth', 1);
y_range = ylim;
h_yaxis = plot([0 0], y_range, 'k--', 'LineWidth', 1);

% === PUNTOS DE ITERACIÓN Y GUÍAS ===
for i = 1:length(iteraciones)-1
    x_i = iteraciones(i);
    y_i = f(x_i);

    % Líneas guía
    plot([x_i x_i], [0 y_i], '--', 'Color', gris);
    plot([0 x_i], [y_i y_i], '--', 'Color', gris);

    % Punto de iteración
    h_iter = plot(x_i, y_i, 'o', ...
        'MarkerEdgeColor', naranja, ...
        'MarkerFaceColor', naranja, ...
        'MarkerSize', 8);

    % Etiqueta cerca del eje X
    text(x_i, 0, sprintf(' Iteración %d', i), ...
        'VerticalAlignment', 'top', ...
        'FontSize', 9, 'Color', naranja, ...
        'Rotation', 0);
end

% === RAÍZ FINAL ===
root_y = f(root);
plot([root root], [0 root_y], '--', 'Color', rojo);
plot([0 root], [root_y root_y], '--', 'Color', rojo);

h_raiz = plot(root, root_y, 'p', ...
    'MarkerEdgeColor', rojo, ...
    'MarkerFaceColor', rojo, ...
    'MarkerSize', 14);

text(root + 0.02, root_y, 'Raíz final', ...
    'FontSize', 10, 'FontWeight', 'bold', 'Color', rojo);

% === DETALLES ADICIONALES ===
title('Método de Newton-Raphson: f(x) = cos(x) - x^3');
xlabel('x');
ylabel('f(x)');

legend([h_func, h_xaxis, h_yaxis, h_iter, h_raiz], ...
    {'f(x)', 'Eje X', 'Eje Y', 'Iteraciones', 'Raíz final'}, ...
    'Location', 'northeast');

grid on;
hold off;

