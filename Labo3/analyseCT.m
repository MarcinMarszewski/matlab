%Filtry i inne takie
minAvgGrad=100;
minSumGrad=115;
minDirectGrad=70;

% Wczytanie obrazu i przekształcenie do formatu double
img = imread('CT.png');
img = double(img(:,:,1));  % Praca z jednym kanałem kolorów

% Definicja osi x i y
x = 1:size(img,2);
y = 1:size(img,1)';

% Obliczenie gradientów px i py
[px, py] = imgGradient(img);

%px=filterImg(px,minGrad);
%py=filterImg(py,minGrad);

gradAvg = sqrt(px .^ 2 + py .^ 2);

gradSum = abs(px) + abs(py);

%Wyświetlenie obrazu
figure, imshow(uint8(img))

pxFiltered=filterImg(px,minDirectGrad);
figure
contour(x, y, pxFiltered)

pyFiltered=filterImg(py,minDirectGrad);
figure
contour(x, y, pyFiltered)

gradAvgFiltered=filterImg(gradAvg,minAvgGrad);
figure
contour(x, y, gradAvgFiltered)

gradSumFiltered=filterImg(gradSum,minSumGrad);
figure
contour(x, y, gradSumFiltered)

gradAvgAreaFiltered=filterAreaImg(gradAvgFiltered,290,200,400,290) + filterAreaImg(gradAvgFiltered,310,400,410,500);
figure
contour(x, y, gradAvgAreaFiltered)

% Wizualizacja konturu i pola wektorowego gradientu
figure
contour(x, y, img)
hold on
quiver(x, y, px, py)
hold off

% Normalizacja gradientu px i wyświetlenie jako obraz binarny
px2 = rescale(px, 1, 256);
figure, imshow(uint8(px2) > 130)

% Wykres wartości funkcji w wycinku obrazu
%f = img(522,:,1);
%plot(f)

% Wyświetlenie gradientu w wybranym wycinku
%fg = px(255,:,1);
%imshow(fg)