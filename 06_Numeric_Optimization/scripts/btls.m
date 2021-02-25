%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% btls.m: Backtracking Line Search com interpolação quadrática
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [alpha, i] = btls(x,alpha0,p,dfxk,fxk)

c1=1e-4;
i=0;                     % contador de interpolações
fxka=fx(x+alpha0*p);

while fxka>(fxk+c1*alpha0*dfxk'*p) % Condição de Decréscimo Suficiente
    alpha0=-dfxk'*p*alpha0^2/(2*(fxka-fxk-dfxk'*p*alpha0));
    fxka=fx(x+alpha0*p);
    i=i+1;
end

alpha=alpha0;