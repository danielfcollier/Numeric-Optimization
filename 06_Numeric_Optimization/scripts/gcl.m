%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% gcl.m: C�lculo da dire��o de busca via GCL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [x,kr,kc] = gcl(A,b,norma)

% iniciliaza��o
x=zeros(4,1);
r=A*x-b;
p0=-r;
SF=0.5;   % par�metro da sequ�ncia for�ante

% crit�rio de parada: converg�ncia ou dire��o de descida encontrada
while ~(norm(r,2)<=min(SF,sqrt(norma))*norma || p0'*A*p0<0)
    alpha=-(r'*p0)/(p0'*A*p0);
    x=x+alpha*p0;
    r=A*x-b;
    beta=(r'*A*p0)/(p0'*A*p0);
    p0=-r+beta*p0;
end

if p0'*A*p0<0 
    kc=1;         % contador de sa�das pela condi��o de curvatura
    kr=0;
else
    kc=0;
    kr=1;         % contador de sa�das pelo res�duo
end