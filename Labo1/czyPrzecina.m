function [s] = czyPrzecina(a,b,c,d)
%CZYPRZECINA
%   Detailed explanation goes here
dt1=det([1,1,1;a(1),b(1),c(1);a(2),b(2),c(2)])*det([1,1,1;a(1),b(1),d(1);a(2),b(2),d(2)]);
dt2=det([1,1,1;a(1),c(1),d(1);a(2),c(2),d(2)])*det([1,1,1;b(1),c(1),d(1);b(2),c(2),d(2)]);
if(dt1<=0 && dt2<=0)
    s=1;
else
    s=0;
end
end

