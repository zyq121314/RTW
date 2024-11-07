function [q0,f,rate] = changeLeg(q)
parameter;
global Flag;

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
[M,~]=getMh(q);
Energy1= 0.5*q(10:18)*M*q(10:18)';
switch Flag
    case 0
        r = AboveLine(p);
        %         for i=1:6
        %             if r(i)<1
        %                 break;
        %             end
        %         end
        [~,i]=min(r);
        index=Match(i);
        [Ji,~] = GetJ(q,index);
        Qp = (eye(9) - M\Ji'/(Ji/M*Ji')*Ji)*q(10:18)';

        [q0(1:9),q0(10:18)]=Rset(q(1:9),Qp,i);
        q0(5)=-q0(4)*tan(phi);
        q0(13)=0;
        q0(14)=0;
        Flag=1;

        f=0;
    case 1
        p(2,2)=100;
        r = AboveLine(p);
        [~,i]=min(r);
        index=Match(i);
        [Ji,~] = GetJ(q,index);
        Qp = (eye(9) - M\Ji'/(Ji/M*Ji')*Ji)*q(10:18)';
        if i==1
            i=2;
        end
        [q0(1:9),q0(10:18)]=Rset(q(1:9),Qp,i);
        q0(5)=-q0(4)*tan(phi);
        q0(13)=0;
        q0(14)=0;

        q0(2)=-q0(1)*tan(phi);
        q0(10)=0;
        q0(11)=0;

        Flag=2;

        if i==3
            f=1;
        else
            f=-1;
        end

    case 2
        p(2,2)=100;
        p(1,2)=100;
        r = AboveLine(p);
        [~,i]=min(r);

        index=Match(i);
        [Ji,~] = GetJ(q,index);
        Qp = (eye(9) - M\Ji'/(Ji/M*Ji')*Ji)*q(10:18)';
        if i==6
            i=2;
        end
        [q0(1:9),q0(10:18)]=Rset(q(1:9),Qp,i);
        q0(5)=-q0(4)*tan(phi);
        q0(13)=0;
        q0(14)=0;

        q0(2)=-q0(1)*tan(phi);
        q0(10)=0;
        q0(11)=0;

        Flag=3;

        if i==3
            f=2;
        else
            f=-1;
        end
end
[M,~]=getMh(q0);
Energy2= 0.5*q0(10:18)*M*q0(10:18)';
rate=Energy2/Energy1;
end


function index=Match(i)
i=rem(i,6);
if i==0
    i=6;
end
switch i
    case 1
        index=11;
    case 2
        index=21;
    case 3
        index=31;
    case 4
        index=14;
    case 5
        index=24;
    case 6
        index=34;
end
end

function [P,V]=Rset(p,v,i)
parameter;
switch i
    case 1
        index=5;
    case 2
        index=0;
    case 3
        index=1;
    case 4
        index=2;
    case 5
        index=3;
    case 6
        index=4;
end
xa=p(1);
za=p(2);
tha=p(3);
xb=p(4);
zb=p(5);
thb=p(6);
xc=p(7);
zc=p(8);
thc=p(9);

dxa=v(1);
dza=v(2);
dtha=v(3);
dxb=v(4);
dzb=v(5);
dthb=v(6);
dxc=v(7);
dzc=v(8);
dthc=v(9);

%% p
xaa= xa + L * sin(tha);
zaa= za + L * cos(tha);
thaa= tha-pi ;

xbb= xb + L * sin(thb);
zbb= zb + L * cos(thb);
thbb= thb-pi;

xcc= xc + L * sin(thc);
zcc= zc + L * cos(thc);
thcc= thc-pi;

%% v
dxaa= dxa + L * cos(tha) *dtha;
dzaa= dza - L * sin(tha)*dtha;
dthaa= dtha;

dxbb= dxb + L * cos(thb)*dthb;
dzbb= dzb - L * sin(thb)*dthb;
dthbb= dthb;

dxcc= dxc + L * cos(thc)*dthc;
dzcc= dzc - L * sin(thc)*dthc;
dthcc= dthc;


pap=[xa za tha;xb zb thb;xc zc thc;xaa zaa thaa;xbb zbb thbb;xcc zcc thcc;xa za tha;xb zb thb];

vov=[dxa dza dtha;dxb dzb dthb;dxc dzc dthc;dxaa dzaa dthaa;dxbb dzbb dthbb;dxcc dzcc dthcc;dxa dza dtha;dxb dzb dthb];


P33=pap(index+1:index+3,:)';
P=P33(:);

V33=vov(index+1:index+3,:)';
V=V33(:);

end
