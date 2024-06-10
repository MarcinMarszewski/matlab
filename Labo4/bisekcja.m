function [miejsce_zerowe] = bisekcja(fun,min,maks,epsilon)
% Miejsce zerowe funkcja z dokładnością epsilon
%   Warunki: min < maks; fun(min) * fun(maks) <=0
if min >= maks
    error("Argument 'min' powinien być mniejszy od 'maks'.");
end
if polyval(fun,min) * polyval(fun,maks) >0
    error("Funkcja na końcach przezdiałów powinna posiadać przeciwne znaki.");
end

while maks-min > epsilon
    centr=(min+maks)/2;
    if sign(polyval(fun,min)*polyval(fun,centr)) == -1
        maks=centr;
    else
        min=centr;
    end
end
miejsce_zerowe = centr;

end