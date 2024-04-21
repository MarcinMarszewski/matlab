plik = fopen('dane.bin', 'w');
W=rand(1,50)
fwrite(plik,W,'float');
fclose(plik);

plik = fopen('dane.bin','r');
w = fread(plik, [4,5],'float')
fclose(plik);

