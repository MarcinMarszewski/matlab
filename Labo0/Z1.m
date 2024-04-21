A=[2,-7;5,4]
B=[6,1;4,-3]
f=[4,1]

size(A)
size(f)
B'
power(A+B,2)+2*(A-B)
C=[A,B]
h=[f,f]
C.*h

whos
save('dane')
clear all
dir

x = 1:1:24;
Y = reshape(x, [6,4])

power(exp(1),2*sin(2*pi))
cos(power(pi/3,4))
log(sqrt(5))

z=3-2j
abs(z)
angle(z)
conj(z)

ones(3,4)
zeros(3,4)
rand(3,4)