function dq = robot(t,q)
parameter;
global Flag 
[M,h] = getMh(q);
F = GetF(q);

J_a=[1 0 0 0 0 0 0 0 0;
    0 1 0 0 0 0 0 0 0];
dJ_a=[0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0];
Xa = J_a/M*J_a';
lambda_a=Xa\(J_a/M*(h-F)-dJ_a*q(10:18));
J_b=[0 0 0 1 0 0 0 0 0;
    0 0 0 0 1 0 0 0 0];
dJ_b=[0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0];
Xb = J_b/M*J_b';
lambda_b=Xb\(J_b/M*(h-F)-dJ_b*q(10:18));

Fs_a=lambda_a(1)*sin(phi)+lambda_a(2)*cos(phi);
Fs_b=lambda_b(1)*sin(phi)+lambda_b(2)*cos(phi);

[J_c1,dJ_c1] = GetJ(q,34);
Xc1 = J_c1/M*J_c1';
lambda_c1=Xc1\(J_c1/M*(h-F)-dJ_c1*q(10:18));
Fs_c1=lambda_c1(1)*sin(phi)+lambda_c1(2)*cos(phi);

switch Flag
    case 0
        ddq=M\(F - h);
    case 1
        if Fs_b<0 
            Flag=0;
            ddq=M\(F - h);
        else
            ddq=M\(J_b'*lambda_b +F - h);
        end

    case 2
        if Fs_a<0 && Fs_b>0
            Flag=1;
            ddq=M\(J_b'*lambda_b +F - h);
        elseif Fs_a<0 && Fs_b<0
            Flag=0;
            ddq=M\(F - h);
        else
            ddq=M\(J_a'*lambda_a + J_b'*lambda_b +F - h);
        end

    case 3
        if Fs_c1<0 && Fs_a>0 && Fs_b>0
            Flag=2;
            ddq=M\(J_a'*lambda_a + J_b'*lambda_b +F - h);
        elseif Fs_c1<0 && Fs_a<0 && Fs_b>0
            Flag=1;
            ddq=M\(J_b'*lambda_b +F - h);
        elseif  Fs_c1<0 && Fs_a<0 && Fs_b<0
            Flag=0;
            ddq=M\(F - h);
        else
            ddq=M\(J_c1'*lambda_c1+J_a'*lambda_a + J_b'*lambda_b +F - h);
        end
end

dq(1:9) = q(10:18);
dq(10:18) = ddq(1:9);
dq=dq';

end