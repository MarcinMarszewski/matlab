A = -10:0.001:10;

tic;
for i=1:size(A,1)
    cos(x);
end
fprintf('Czas dla metody iteracyjnej:');
toc

tic
cos(A);
fprintf('Czas dla metody tablicowej:')
toc