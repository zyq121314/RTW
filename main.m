close all;
clear all;
clc;

global Flag odetimes error rT rFlag rGround
parameter

Tstart=30;
Tend=40;
dt=0.001;

disp(' ')
disp(' ')
disp(phi)
disp(k)
disp(c)


time=[];
result=[];
Rate=[];
tc=[];
KK=[];
rT=[];
rFlag=[];
rGround=[];
FFlag=[];

tspan = 0:dt:Tend;
q0 = [0 0.2+0.0 30/180*pi L/2 0.2+0.0 -30/180*pi 3/4*L 3/4*L+0.0 -90/180*pi 0.3 0 3 0.3 0 3 0.3 0 3];
options = odeset('Events',@detectCollision,'RelTol',1e-6,'AbsTol',1e-6*ones(1,18),'Refine',9);
Flag=0;
error=0;
while 1
    odetimes=0;
    [T, Q] = ode45(@robot, tspan, q0, options);
            time=[time;T];
        result=[result;Q];
    if error>0
        break;
    end
    if T(end)<Tend-dt
        tspan=T(end):dt:Tend;
    else
        break;
    end

    [q0,f,rate] = changeLeg(Q(end, :));
    if tspan(1)>Tstart

        if f>-1
            tc=[tc T(end)];
            KK=[KK k];
            Rate=[Rate rate];
        end
    end

end
Movie