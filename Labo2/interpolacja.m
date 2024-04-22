function [funkcja] = interpolacja(pktX,pktY)% punkty x,y
%INTERPOLACJA Summary of this function goes here
%   Detailed explanation goes here

funkcja = '0';
n = size(pktX,2);
for i = 1:n
    ff='1';
    div=0;
    for j = 1:n
        if j ~= i
            
            ff = [ff  sprintf('*((x-%d)/%d)',pktX(j),pktX(i)-pktX(j))];
        end
    end
    funkcja = [funkcja sprintf('+%s*%d',ff,pktY(i))];
end
end