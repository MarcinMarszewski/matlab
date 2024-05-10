function [filteredImg] = filterAreaImg(img,x1,y1,x2,y2)
%FILTERAREAIMG Summary of this function goes here
%   Detailed explanation goes here
width = size(img,1);
height = size(img,2);
if x1 > width || x2 > width || y1 > height || y2 > height || x1<1 || x2<1 || y1<1 || y2<1
    error('Points must be valid matrix coordinates')
end
filteredImg=zeros(width,height);
for x=x1:x2
    for  y=y1:y2
        filteredImg(x,y)=img(x,y);
    end
end
end

