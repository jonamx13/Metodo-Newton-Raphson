function [root, iteraciones, f] = newton_raphson(f, df, x0, tol, maxIter)
% NEWTON_RAPHSON: Ejecuta el método de Newton-Raphson
% Entrada:
%   f       - función f(x)
%   df      - derivada f'(x)
%   x0      - valor inicial
%   tol     - tolerancia
%   maxIter - número máximo de iteraciones
% Salida:
%   root        - raíz encontrada
%   iteraciones - lista de valores intermedios
%   f           - función original (devuelta para la gráfica)

    x = x0;
    iteraciones = x0;

    for k = 1:maxIter
        fx = f(x);
        dfx = df(x);

        if abs(dfx) < eps
            error('Derivada cercana a cero en iteración %d', k);
        end

        x_new = x - fx / dfx;
        iteraciones(end + 1) = x_new;

        if abs(x_new - x) < tol
            root = x_new;
            printf('Converge en %d iteraciones.\n', k);
            printf('Raíz aproximada: %.10f\n', root);
            return;
        end

        x = x_new;
    end

    error('No converge después de %d iteraciones.', maxIter);
end
