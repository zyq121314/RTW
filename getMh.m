function [M,h] = getMh(q)
parameter;

x=q(1);
z=q(2);
th=q(3);
dx=q(10);
dz=q(11);
dth=q(12);

M1=[m,0,(1/2).*L.*m.*cos(th);0,m,(-1/2).*L.*m.*sin(th);(1/2).*L.*m.* ...
cos(th),(-1/2).*L.*m.*sin(th),I+(1/4).*L.^2.*m];

h1=[(-1/2).*dth.^2.*L.*m.*sin(th);g.*m+(-1/2).*dth.^2.*L.*m.*cos(th); ...
(-1/2).*g.*L.*m.*sin(th)];

x=q(4);
z=q(5);
th=q(6);
dx=q(13);
dz=q(14);
dth=q(15);

M2=[m,0,(1/2).*L.*m.*cos(th);0,m,(-1/2).*L.*m.*sin(th);(1/2).*L.*m.* ...
cos(th),(-1/2).*L.*m.*sin(th),I+(1/4).*L.^2.*m];

h2=[(-1/2).*dth.^2.*L.*m.*sin(th);g.*m+(-1/2).*dth.^2.*L.*m.*cos(th); ...
(-1/2).*g.*L.*m.*sin(th)];

x=q(7);
z=q(8);
th=q(9);
dx=q(16);
dz=q(17);
dth=q(18);

M3=[m,0,(1/2).*L.*m.*cos(th);0,m,(-1/2).*L.*m.*sin(th);(1/2).*L.*m.* ...
cos(th),(-1/2).*L.*m.*sin(th),I+(1/4).*L.^2.*m];

h3=[(-1/2).*dth.^2.*L.*m.*sin(th);g.*m+(-1/2).*dth.^2.*L.*m.*cos(th); ...
(-1/2).*g.*L.*m.*sin(th)];

M=[ M1(1,1:3) 0 0 0 0 0 0;
    M1(2,1:3) 0 0 0 0 0 0;
    M1(3,1:3) 0 0 0 0 0 0;
    0 0 0 M2(1,1:3) 0 0 0;
    0 0 0 M2(2,1:3) 0 0 0;
    0 0 0 M2(3,1:3) 0 0 0;
    0 0 0 0 0 0 M3(1,1:3);
    0 0 0 0 0 0 M3(2,1:3);
    0 0 0 0 0 0 M3(3,1:3)];
h=[h1;h2;h3];

end

