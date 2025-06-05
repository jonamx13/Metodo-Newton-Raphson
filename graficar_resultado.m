function graficar_resultado(f, root, iteraciones)
% GRAFICAR_RESULTADO: Dibuja la función, iteraciones y raíz encontrada
% Entrada:
%   f           - función evaluada f(x)
%   root        - raíz aproximada
%   iteraciones - lista de iteraciones

    figure;
    hold on;

    % Paleta de colores personalizada
    naranja = [1, 0.5, 0];
    rojo    = [1, 0, 0];
    gris    = [0.5 0.5 0.5];

    % Intervalo para graficar
    x_vals = linspace(0, 1.2, 1000);
    y_vals = f(x_vals);

    % Curva de la función
    h_func = plot(x_vals, y_vals, 'b-', 'LineWidth', 2);

    % Ejes X y Y punteados
    h_xaxis = plot(x_vals, zeros(size(x_vals)), 'k--', 'LineWidth', 1);
    y_range = ylim;
    h_yaxis = plot([0 0], y_range, 'k--', 'LineWidth', 1);

    % Dibujar iteraciones
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

        % Etiqueta
        text(x_i, 0, sprintf(' Iteración %d', i), ...
            'VerticalAlignment', 'top', ...
            'FontSize', 9, 'Color', naranja);
    end

    % Raíz final
    root_y = f(root);
    plot([root root], [0 root_y], '--', 'Color', rojo);
    plot([0 root], [root_y root_y], '--', 'Color', rojo);

    h_raiz = plot(root, root_y, 'p', ...
        'MarkerEdgeColor', rojo, ...
        'MarkerFaceColor', rojo, ...
        'MarkerSize', 14);

    % Etiqueta raíz
    text(root + 0.02, root_y, 'Raíz final', ...
        'FontSize', 10, 'FontWeight', 'bold', 'Color', rojo);

    % Etiquetas generales
    title('Método de Newton-Raphson: f(x) = cos(x) - x^3');
    xlabel('x');
    ylabel('f(x)');

    legend([h_func, h_xaxis, h_yaxis, h_iter, h_raiz], ...
        {'f(x)', 'Eje X', 'Eje Y', 'Iteraciones', 'Raíz final'}, ...
        'Location', 'northeast');

    grid on;
    hold off;
end

