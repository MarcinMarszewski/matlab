A = zeros(6);
for i=1:6
    for j =1:6
        if i ~= j
            A(i,j) = 1/(i-j);
        end
    end
end
A

B = rand(10)
B(B>=0.2 & B<=0.5)

