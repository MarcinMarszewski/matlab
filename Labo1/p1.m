plikiksztaltow = {'kwadrat.txt','trojkat.txt','romb.txt','smieszne.txt'};
obliczonepola = [0.25,0.5,0.4,0.375];
for l=1:4
    
    A=load(plikiksztaltow{l})
    wlasciwepole=obliczonepola(l)
    
    n=1;
    pole = [];
    liczbaprob = [];
    wlasciwalinia=[];
    
    makseksponent=7; %liczba prób
    mnoznik=5; %zwiększenie w każdym kroku
    
    for s=1:makseksponent
        n=n*mnoznik;
        calosc=0; %calkowita liczba prob
        wewnatrz=0; %liczba punktow wewnatrz ksztaltu
        for a=1:n
            if czyPunktWSrodku(rand(2,2),A)
                wewnatrz=wewnatrz+1;
            end
        end
        wlasciwalinia=[wlasciwalinia,wlasciwepole];
        liczbaprob=[liczbaprob,n];
        pole=[pole,wewnatrz/n];
    end
    
    semilogx(liczbaprob,pole,'b',liczbaprob,wlasciwalinia);
    title(plikiksztaltow{l});
end
pole(makseksponent)

%sprawdzenie przecięcia linii wyznacznikiem macierzy
%czy punkt jest w figurze - liczba przecięć linii pionowej
%wykres pola wyliczonego od pola faktycznego (isod jak powinno wyglądać)