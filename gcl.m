%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% gcl.m: Cálculo da direção de busca via GCL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [x,kr,kc] = gcl(A,b,norma)

% iniciliazação
x=zeros(4,1);
r=A*x-b;
p0=-r;
SF=0.5;   % parâmetro da sequência forçante

% critério de parada: convergência ou direção de descida encontrada
while ~(norm(r,2)<=min(SF,sqrt(norma))*norma || p0'*A*p0<0)
    alpha=-(r'*p0)/(p0'*A*p0);
    x=x+alpha*p0;
    r=A*x-b;
    beta=(r'*A*p0)/(p0'*A*p0);
    p0=-r+beta*p0;
end

if p0'*A*p0<0 
    kc=1;         % contador de saídas pela condição de curvatura
    kr=0;
else
    kc=0;
    kr=1;         % contador de saídas pelo resíduo
end