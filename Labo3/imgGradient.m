function [dx,dy] = imgGradient(img)
%IMGGRADIENT Summary of this function goes here
%   Detailed explanation goes here
width = size(img,1);
height = size(img,2);
dx=zeros(width,height);
dy=zeros(width,height);
for x=1:width-1
    for  y=1:height-1
        dx(x,y)=img(x,y+1)-img(x,y);
        dy(x,y)=img(x+1,y)-img(x,y);
    end
end
end

