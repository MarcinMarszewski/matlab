n = input('Podaj rozmiar macierzy:');
A = input('Podaj macierz A:');
B = input('Podaj macierz B:');

fprintf("Macierz odwrotna do A:");
inv(A)
fprintf("Transpozycja macierzy B:");
B'
fprintf('A+B:');
A+B
fprintf('A-B:');
A-B
fprintf('A*B:');
A*B
fprintf('A*5:');
A*5