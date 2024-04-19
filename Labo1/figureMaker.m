trojkat=[0,0;0,1;1,0];% 50%
kwadrat=[0,0;0.5,0;0.5,0.5;0,0.5];% 1/64
romb=[0,0.5;1,0.5;0.8,1;0.2,1];% 40%
smieszne=[0,0;1,0;1,0.5;0.5,0.25;0,0.5];

dlmwrite('trojkat.txt', trojkat, 'delimiter', '\t');
dlmwrite('kwadrat.txt', kwadrat, 'delimiter', '\t');
dlmwrite('romb.txt', romb, 'delimiter', '\t');
dlmwrite('smieszne.txt', smieszne, 'delimiter', '\t');