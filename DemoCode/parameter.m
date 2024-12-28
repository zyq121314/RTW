
phi=0.05;
Aalpha=0.0625*3;
rho=2.5;
Ff=2.7;  
Zeta=0.2; 

L=0.8;
g=9.81;

m=L.*rho;    
I=m.*L^2/12; 
Ls=L.*Aalpha;    
LLc=L/2-Ls;
k=Ff.^2.*I.*4.*pi^2./(LLc.^2);
c=4/5*(I.*k./(LLc.^2)).^0.5.*Zeta; 