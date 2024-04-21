Tc=0:20:300;
Tk=(9/5)*Tc + 32;

plik = fopen('temperatura.txt', 'w');
fprintf(plik,'%4.2f\t%4.2f\n',[Tc;Tk]);
fclose(plik);