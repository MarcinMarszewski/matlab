function [filteredImg] = filterImg(img,minVal)
%FILTERIMG Summary of this function goes here
%   Detailed explanation goes here
width = size(img,1);
height = size(img,2);
filteredImg=zeros(width,height);
for x=1:width
    for  y=1:height
        if abs(img(x,y))>=minVal
            filteredImg(x,y)=img(x,y);
        end
    end
end
end

