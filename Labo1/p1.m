
a=10; %liczba punktów kształtu
A = rand(a,2); %punkty kształtu


p= rand(2);
calosc=0;
przeciecia=0;
for i=1:size(A,1)-1;
    calosc=calosc+1;
    przeciecia +=czyPrzecina(A(i,:),A(i+1,:),p,[p(1),0]);
end

%sprawdzenie przecięcia linii wyznacznikiem macierzy
%czy punkt jest w figurze - liczba przecięć linii pionowej
%wykres pola wyliczonego od pola faktycznego (isod jak powinno wyglądać)