plik = fopen('temperatura.txt', 'r');
A = fscanf(plik, '%f %f', [2,Inf]);
fclose(plik);

Tc=A(1,:)
Tk=A(2,:)