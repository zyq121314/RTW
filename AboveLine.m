function r = AboveLine(p)
%判断点与函数的位置关系
%输入，例p=[1,2;2,5;3,6]；
parameter;
y=-p(:,1).*tan(phi); %地面的函数表达式
r=p(:,2)-y;
end


