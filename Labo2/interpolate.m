function [result] = interpolate(x, y, resultPoints)
    % Sprawdzenie, czy liczba punktów jest równa
    if length(x) ~= length(y)
        error('Liczba punktów musi być taka sama.');
    end
    
    n = length(x);
    coefficients = zeros(1, n);
    
    for i = 1:n
        % Liczenie wielomianu Lagrange'a dla i-tego punktu
        L = [1];
        for j = 1:n
            if j ~= i
                L = conv(L, [1,-x(j)] / (x(i) - x(j)) );
            end
        end
        li{i}=L;
    end
    for i=1:n
    coefficients = coefficients(1:n) + (y(i) * li{i}(1:n));
    end
    result = polyval(coefficients, resultPoints);
end
