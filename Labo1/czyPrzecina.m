function [s] = czyPrzecina(a,b,c,d)
%CZYPRZECINA
%   Detailed explanation goes here
AB=[b(1)-a(1) b(2)-a(2)];
AC=[c(1)-a(1) c(2)-a(2)];
AD=[d(1)-a(1) d(2)-a(2)];

d1= AB(1)*AC(2) - AB(2)*AC(1);
d2= AB(1)*AD(2) - AB(2)*AD(1);
s=sign(d1) ~= sign(d2)
end

