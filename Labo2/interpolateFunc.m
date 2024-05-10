function [result] = interpolateFunc(x, y, resultPoints)
func = '0';
n = size(x,2);
for i = 1:n
    ff='1';
    div=0;
    for j = 1:n
        if j ~= i
            
            ff = [ff  sprintf('*((x-%d)/%d)',x(j),x(i)-x(j))];
        end
    end
    func = [func sprintf('+%s*%d',ff,y(i))];
end
fn = str2func(['@(x) ' func]);
result = [];
for i =1:size(resultPoints,1)
    result=[result fn(resultPoints(i))];
end

end
