%konfiguracja
makseksponent=7; %liczba prób
mnoznik=5; %zwiększenie w każdym kroku
bok=1;

nazwy = {'Kwadrat:','Trójkąt:','Trapez:','Pięciokąt:'};

ksztalty = cell(1,4);
ksztalty{1} = [0,0;0.5,0;0.5,0.5;0,0.5];    %kwadrat
ksztalty{2} = [0,0;0,1;1,0];                %trojkat
ksztalty{3} = [0,0.5;1,0.5;0.8,1;0.2,1];    %romb
ksztalty{4} = [0,0;1,0;1,0.5;0.5,0.25;0,0.5];   %pieciakat wklesly

obliczonepola = [0.25,0.5,0.4,0.375];       %pola obliczone analitycznie
l=input("Podaj numer ksztaltu:");
A=ksztalty{l};
wlasciwepole=obliczonepola(l)
    
pole = [];
liczbaprob = [];
wlasciwalinia=[];
    
pola=[];

for pp=1:100
n=1;
pole=[];
liczbaprob=[];
wlasciwalinia=[];
for s=1:makseksponent
    n=n*mnoznik;
    calosc=0;
    wewnatrz=0;
    for a=1:n
        if czyPunktWSrodku(rand(2,2)*bok,A)
            wewnatrz=wewnatrz+1;
        end
    end
    wlasciwalinia=[wlasciwalinia,wlasciwepole];
    liczbaprob=[liczbaprob,n];
    pole=[pole,(wewnatrz/n)*(bok*bok)];
end
pola=[pola pole(makseksponent)];
end
minimum = min(pola)
maksimum = max(pola)
srednia = mean(pola)
mediana = median(pola)
    
semilogx(liczbaprob,pole,'b',liczbaprob,wlasciwalinia);
title(nazwy{l});
obliczone_pole = pole(makseksponent)