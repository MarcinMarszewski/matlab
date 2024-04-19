function [czyWSrodku] = czyPunktWSrodku(punkt,ksztalt)
%CZYPUNKTWSRODKU Summary of this function goes here
%   Detailed explanation goes here
przeciecia=0;
for i=1:size(ksztalt,1)
    a=ksztalt(i,:);
    b=ksztalt(mod(i,size(ksztalt,1))+1,:);

    if czyPrzecina(a,b,[punkt(2),-1],punkt)
        przeciecia = przeciecia+1;
    end
end
czyWSrodku = mod(przeciecia,2)==1;
end

