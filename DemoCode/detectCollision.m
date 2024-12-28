function [value, isterminal, direction] = detectCollision(t, q)

parameter;

global Flag odetimes error

p(1,1)=q(1);
p(1,2)=q(2);
p(2,1)=q(4);
p(2,2)=q(5);
p(3,1)=q(7);
p(3,2)=q(8);
p(4,1)=q(1)+L*sin(q(3));
p(4,2)=q(2)+L*cos(q(3));
p(5,1)=q(4)+L*sin(q(6));
p(5,2)=q(5)+L*cos(q(6));
p(6,1)=q(7)+L*sin(q(9));
p(6,2)=q(8)+L*cos(q(9));

value=1000;
switch Flag
    case 0
        r = AboveLine(p);
        value=min(r);
    case 1
        p(2,2)=100;
        r = AboveLine(p);
        value=min(r);
    case 2
        p(2,2)=100;
        p(1,2)=100;
        r = AboveLine(p);
        value=min(r);
    case 3
        p(2,2)=100;
        p(1,2)=100;
        p(6,2)=100;
        r = AboveLine(p);
        value=min(r);
        if value<0
            error=1;
        end
end

if odetimes<5
    value=100;
end
if odetimes>300
     error=1;
    value=-100;
end

odetimes=odetimes+1;
isterminal = 1;    
direction = -1;    
end