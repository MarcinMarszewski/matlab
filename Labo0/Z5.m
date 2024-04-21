fzero(@sin, 3)

roots([1,3,-4])
roots([-2,3,1,-6])

A=[1,2,3,4;3,4,5,6;2,3,5,0;3,5,2,1];
b=[1;2;4;6];
linsolve(A,b)

rank(A)
det(A)

x = -10:0.5:10;
y = cos(3*x) + cos(x);
xi = -10:0.1:10;

ylinear = interp1(x, y, xi, 'linear');
ynearest = interp1(x, y, xi, 'nearest');
yspline = interp1(x, y, xi, 'spline');

stopnie_wielomianu = [2, 5, 10];
ypolyfit = cell(size(stopnie_wielomianu));

for i = 1:length(stopnie_wielomianu)
    wspolczynniki = polyfit(x, y, stopnie_wielomianu(i));
    
    ypolyfit{i} = polyval(wspolczynniki, xi);
end

figure;

plot(xi, ylinear, '-r', 'DisplayName', 'Interpolacja liniowa');
hold on;
plot(xi, ynearest, '--g', 'DisplayName', 'Interpolacja najbliższa');
plot(xi, yspline, ':b', 'DisplayName', 'Interpolacja sklejana');

for i = 1:length(stopnie_wielomianu)
    plot(xi, ypolyfit{i}, 'Color', [0.5, 0.5, 0.5], 'LineWidth', 1, 'DisplayName', ['Polyfit, stopień ', num2str(stopnie_wielomianu(i))]);
end
scatter(x, y, 'k', 'filled', 'DisplayName', 'Węzły interpolacji');
hold off;

legend('show');
title('Interpolacja funkcji y(x) = cos(3x) + cos(x)');
xlabel('x');
ylabel('y');

integral(@(x) (x-1).^2,-2,2)
integral(@(x) x+2*sin(x),-pi/2,pi/2)