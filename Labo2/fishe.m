image = imread('Fish_example.tif');
img = im2double(image); %2070, 1548

red = img(:,:,1); %560, 20
green = img(:,:,2); %575, 19
blue = img(:,:,3);

gw=50;
rw=30;

colordiff=0.2;

redMin=0.3;
greenMin=0.3;

nOfSamples=200;
range=20;

originalPoints =-(range/2):1:(range/2);
interpPoints=-(range/4):(range/(2*nOfSamples)):(range/4);


getGreenPoints = @(x,y) green(y,(x-(range/2)):1:(x+(range/2)));
getRedPoints = @(x,y) red(y,(x-(range/2)):1:(x+(range/2)));

greenInterp = @(x,y) interpolate(originalPoints,getGreenPoints(x,y),interpPoints);
redInterp = @(x,y) interpolate(originalPoints,getRedPoints(x,y),interpPoints);

greenFunc = greenInterp(424,225);
redFunc = redInterp(553,236);


height = size(red,1);
width = size(red,2);

greenPoints = [];
redPoints = [];
for y = 11:height-10 
    for x= 11:width-10 
        if all(green(y,x) > (red(y,x)+colordiff)) && all( green(y,x) > greenMin ) && all( sum(abs(greenInterp(x,y)-greenFunc)) < gw )
            greenPoints = [greenPoints;x,y];
        end
        if all(red(y,x) > (green(y,x)+colordiff)) && all( red(y,x) > redMin ) && all( sum(abs(redInterp(x,y)-redFunc)) < rw )
            redPoints = [redPoints;x,y];
        end
    end
end

figure;
imshow(image);
title('Obraz FISH');

% Wizualizacja wykrytych punktów
hold on;
plot(greenPoints(:,1),greenPoints(:,2), 'w.');
plot(redPoints(:,1),redPoints(:,2), 'b.');
hold off;

figure;
plot(interpPoints,redFunc,'bo-');
xlabel('X:');
ylabel('Y:');
title('Wartość składowej czerwonej w wybranym punkcie świecenia');
grid on;

figure;
plot(interpPoints,greenFunc,'bo-');
xlabel('X:');
ylabel('Y:');
title('Wartość składowej zielonej w wybranym punkcie świecenia');
grid on;