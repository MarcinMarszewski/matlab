image = imread('Obrazy/melanoma/ISIC_0010608_melanoma_45_male_back.jpg');
img = rgb2gray(image);
img = double(img);

offset = 170;
img = img - offset;

miejsca_zerowe=zeros(size(img,1),size(img,2));
m_zerowe = [];
xcentrum=round(size(img,1)/2);
ycentrum=round(size(img,2)/2);
ymax=size(img,2);
xmax=size(img,1);

radius = floor(min(ymax,xmax)/2);

for y = ycentrum-radius:1:ycentrum+radius
    dy = abs(y-ycentrum);
    height = floor(sqrt(radius^2-dy^2));

    if height <= 3
        continue;
    end
    funTop = polyfit(max(1,xcentrum-height):1:xcentrum, img(max(1,xcentrum-height):1:xcentrum,y),3);
    funBottom = polyfit(xcentrum:1:xcentrum+height, img(xcentrum:1:xcentrum+height,y),3);

    if polyval(funTop, xcentrum-height) * polyval(funTop, xcentrum) <= 0
        xzero = round(bisekcja(funTop,xcentrum-height, xcentrum,0.1));
        m_zerowe = [m_zerowe;xzero,y];
    end

    if polyval(funBottom, xcentrum+height) * polyval(funBottom, xcentrum) <= 0
        xzero = round(bisekcja(funBottom,xcentrum, xcentrum+height,0.1));
        m_zerowe = [m_zerowe;xzero,y];
    end
end

for x = xcentrum-radius:1:xcentrum+radius
    dx = abs(x-xcentrum);
    height = floor(sqrt(radius^2-dx^2));

    if height <= 3
        continue;
    end

    funTop = polyfit(ycentrum-height:1:ycentrum, img(x,ycentrum-height:1:ycentrum)',3);
    funBottom = polyfit(ycentrum:1:ycentrum+height, img(x,ycentrum:1:ycentrum+height)',3);

    if polyval(funTop, ycentrum-height) * polyval(funTop, ycentrum) <= 0
        yzero = round(bisekcja(funTop,ycentrum-height, ycentrum,0.1));
        m_zerowe = [m_zerowe;x,yzero];
    end

    if polyval(funBottom, ycentrum+height) * polyval(funBottom, ycentrum) <= 0
        yzero = round(bisekcja(funBottom,ycentrum, ycentrum+height,0.1));
        m_zerowe = [m_zerowe;x,yzero];
    end
end

imshow(image);
hold on;
plot(m_zerowe(:,2),m_zerowe(:,1), 'w.');