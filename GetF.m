function F = GetF(q)

parameter;

Xa=q(1);
Za=q(2);
tha=q(3);
Xb=q(4);
Zb=q(5);
thb=q(6);
Xc=q(7);
Zc=q(8);
thc=q(9);

% Xa1=Xa+L*sin(tha);
% Za1=Za+L*cos(tha);
% Xb1=Xb+L*sin(thb);
% Zb1=Zb+L*cos(thb);
% Xc1=Xc+L*sin(thc);
% Zc1=Zc+L*cos(thc);

Xac=Xa+Ls*sin(tha);
Zac=Za+Ls*cos(tha);
Xbc=Xb+Ls*sin(thb);
Zbc=Zb+Ls*cos(thb);
Xcc=Xc+Ls*sin(thc);
Zcc=Zc+Ls*cos(thc);

Xa1c=Xa+(L-Ls)*sin(tha);
Za1c=Za+(L-Ls)*cos(tha);
Xb1c=Xb+(L-Ls)*sin(thb);
Zb1c=Zb+(L-Ls)*cos(thb);
Xc1c=Xc+(L-Ls)*sin(thc);
Zc1c=Zc+(L-Ls)*cos(thc);

dXa=q(10);
dZa=q(11);
dtha=q(12);
dXb=q(13);
dZb=q(14);
dthb=q(15);
dXc=q(16);
dZc=q(17);
dthc=q(18);

% dXa1=dXa+L*cos(tha)*dtha;
% dZa1=dZa-L*sin(tha)*dtha;
% dXb1=dXb+L*cos(thb)*dthb;
% dZb1=dZb-L*sin(thb)*dthb;
% dXc1=dXc+L*cos(thc)*dthc;
% dZc1=dZc-L*sin(thc)*dthc;

dXac=dXa+Ls*cos(tha)*dtha;
dZac=dZa-Ls*sin(tha)*dtha;
dXbc=dXb+Ls*cos(thb)*dthb;
dZbc=dZb-Ls*sin(thb)*dthb;
dXcc=dXc+Ls*cos(thc)*dthc;
dZcc=dZc-Ls*sin(thc)*dthc;

dXa1c=dXa+(L-Ls)*cos(tha)*dtha;
dZa1c=dZa-(L-Ls)*sin(tha)*dtha;
dXb1c=dXb+(L-Ls)*cos(thb)*dthb;
dZb1c=dZb-(L-Ls)*sin(thb)*dthb;
dXc1c=dXc+(L-Ls)*cos(thc)*dthc;
dZc1c=dZc-(L-Ls)*sin(thc)*dthc;

D_ac_bc=((Zbc-Zac)^2+(Xbc-Xac)^2)^0.5;
D_bc_ac=((Zbc-Zac)^2+(Xbc-Xac)^2)^0.5;
D_bc_cc=((Zbc-Zcc)^2+(Xbc-Xcc)^2)^0.5;
D_cc_bc=((Zcc-Zbc)^2+(Xcc-Xbc)^2)^0.5;
D_cc_a1c=((Za1c-Zcc)^2+(Xa1c-Xcc)^2)^0.5;
D_a1c_cc=((Zcc-Za1c)^2+(Xcc-Xa1c)^2)^0.5;
D_a1c_b1c=((Zb1c-Za1c)^2+(Xb1c-Xa1c)^2)^0.5;
D_b1c_a1c=((Zb1c-Za1c)^2+(Xb1c-Xa1c)^2)^0.5;
D_b1c_c1c=((Zb1c-Zc1c)^2+(Xb1c-Xc1c)^2)^0.5;
D_c1c_b1c=((Zc1c-Zb1c)^2+(Xc1c-Xb1c)^2)^0.5;
D_c1c_ac=((Zc1c-Zac)^2+(Xc1c-Xac)^2)^0.5;
D_ac_c1c=((Zac-Zc1c)^2+(Xac-Xc1c)^2)^0.5;

V_ac_bc=[dXbc-dXac;dZbc-dZac];
V_bc_ac=[dXac-dXbc;dZac-dZbc];
V_cc_bc=[dXbc-dXcc;dZbc-dZcc];
V_bc_cc=[dXcc-dXbc;dZcc-dZbc];
V_cc_a1c=[dXa1c-dXcc;dZa1c-dZcc];
V_a1c_cc=[dXcc-dXa1c;dZcc-dZa1c];
V_a1c_b1c=[dXb1c-dXa1c;dZb1c-dZa1c];
V_b1c_a1c=[dXa1c-dXb1c;dZa1c-dZb1c];
V_c1c_b1c=[dXb1c-dXc1c;dZb1c-dZc1c];
V_b1c_c1c=[dXc1c-dXb1c;dZc1c-dZb1c];
V_ac_c1c=[dXc1c-dXac;dZc1c-dZac];
V_c1c_ac=[dXac-dXc1c;dZac-dZc1c];

S_ac_bc=[Xbc-Xac;Zbc-Zac];
S_bc_ac=[Xac-Xbc;Zac-Zbc];
S_cc_bc=[Xbc-Xcc;Zbc-Zcc];
S_bc_cc=[Xcc-Xbc;Zcc-Zbc];
S_cc_a1c=[Xa1c-Xcc;Za1c-Zcc];
S_a1c_cc=[Xcc-Xa1c;Zcc-Za1c];
S_a1c_b1c=[Xb1c-Xa1c;Zb1c-Za1c];
S_b1c_a1c=[Xa1c-Xb1c;Za1c-Zb1c];
S_c1c_b1c=[Xb1c-Xc1c;Zb1c-Zc1c];
S_b1c_c1c=[Xc1c-Xb1c;Zc1c-Zb1c];
S_ac_c1c=[Xc1c-Xac;Zc1c-Zac];
S_c1c_ac=[Xac-Xc1c;Zac-Zc1c];

U_ac_bc=S_ac_bc./D_ac_bc;
U_bc_ac=S_bc_ac./D_bc_ac;
U_cc_bc=S_cc_bc./D_cc_bc;
U_bc_cc=S_bc_cc./D_bc_cc;
U_cc_a1c=S_cc_a1c./D_cc_a1c;
U_a1c_cc=S_a1c_cc./D_a1c_cc;
U_a1c_b1c=S_a1c_b1c./D_a1c_b1c;
U_b1c_a1c=S_b1c_a1c./D_b1c_a1c;
U_c1c_b1c=S_c1c_b1c./D_c1c_b1c;
U_b1c_c1c=S_b1c_c1c./D_b1c_c1c;
U_ac_c1c=S_ac_c1c./D_ac_c1c;
U_c1c_ac=S_c1c_ac./D_c1c_ac;

v1=cof*(L-2*Ls)/2;
v2=cof*(L-2*Ls)/2;
v3=cof*(L-2*Ls)/2;
v4=cof*(L-2*Ls)/2;
v5=cof*(L-2*Ls)/2;
v6=cof*(L-2*Ls)/2;

f1=k*(D_ac_bc-v1) + c*(dot(S_ac_bc,V_ac_bc)/D_ac_bc);
f2=k*(D_bc_ac-v1) + c*(dot(S_bc_ac,V_bc_ac)/D_bc_ac);

f3=k*(D_bc_cc-v2) + c*(dot(S_bc_cc,V_bc_cc)/D_bc_cc);
f4=k*(D_cc_bc-v2) + c*(dot(S_cc_bc,V_cc_bc)/D_cc_bc);

f5=k*(D_cc_a1c-v3) + c*(dot(S_cc_a1c,V_cc_a1c)/D_cc_a1c);
f6=k*(D_a1c_cc-v3) + c*(dot(S_a1c_cc,V_a1c_cc)/D_a1c_cc);

f7=k*(D_a1c_b1c-v4) + c*(dot(S_a1c_b1c,V_a1c_b1c)/D_a1c_b1c);
f8=k*(D_b1c_a1c-v4) + c*(dot(S_b1c_a1c,V_b1c_a1c)/D_b1c_a1c);

f9=k*(D_b1c_c1c-v5) + c*(dot(S_b1c_c1c,V_b1c_c1c)/D_b1c_c1c);
f10=k*(D_c1c_b1c-v5) + c*(dot(S_c1c_b1c,V_c1c_b1c)/D_c1c_b1c);

f11=k*(D_c1c_ac-v6) + c*(dot(S_c1c_ac,V_c1c_ac)/D_c1c_ac);
f12=k*(D_ac_c1c-v6) + c*(dot(S_ac_c1c,V_ac_c1c)/D_ac_c1c);

if f1<0
    f1=0;
end
if f2<0
    f2=0;
end
if f3<0
    f3=0;
end
if f4<0
    f4=0;
end
if f5<0
    f5=0;
end
if f6<0
    f6=0;
end
if f7<0
    f7=0;
end
if f8<0
    f8=0;
end
if f9<0
    f9=0;
end
if f10<0
    f10=0;
end
if f11<0
    f11=0;
end
if f12<0
    f12=0;
end

u1=f1*U_ac_bc;
u2=f2*U_bc_ac;
u3=f3*U_bc_cc;
u4=f4*U_cc_bc;
u5=f5*U_cc_a1c;
u6=f6*U_a1c_cc;
u7=f7*U_a1c_b1c;
u8=f8*U_b1c_a1c;
u9=f9*U_b1c_c1c;
u10=f10*U_c1c_b1c;
u11=f11*U_c1c_ac;
u12=f12*U_ac_c1c;

Jac=[1 0 Ls*cos(tha) 0 0 0 0 0 0;
    0 1 -Ls*sin(tha) 0 0 0 0 0 0];
Jbc=[0 0 0 1 0 Ls*cos(thb) 0 0 0;
    0 0 0 0 1 -Ls*sin(thb) 0 0 0];
Jcc=[0 0 0 0 0 0 1 0 Ls*cos(thc);
    0 0 0 0 0 0 0 1 -Ls*sin(thc)];
Ja1c=[1 0 (L-Ls)*cos(tha) 0 0 0 0 0 0;
    0 1 -(L-Ls)*sin(tha) 0 0 0 0 0 0];
Jb1c=[0 0 0 1 0 (L-Ls)*cos(thb) 0 0 0;
    0 0 0 0 1 -(L-Ls)*sin(thb) 0 0 0];
Jc1c=[0 0 0 0 0 0 1 0 (L-Ls)*cos(thc);
    0 0 0 0 0 0 0 1 -(L-Ls)*sin(thc)];
S=[ Jac', Jbc' , Jbc', Jcc', Jcc',Ja1c' , Ja1c', Jb1c' , Jb1c', Jc1c',Jc1c',Jac',];

F=S*[u1;u2;u3;u4;u5;u6;u7;u8;u9;u10;u11;u12];

end