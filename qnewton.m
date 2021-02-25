%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% qnewton.m: Otimiza��o via M�todo Quase-Newton 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

toler=1e-3; % toler�ncia

% inicializa��o
k=1;
h=1;
n=2; % ordem do problema
I=eye(n,n);
H=I;
f(k)=fx(x);
dfxk=dfx(x);
norma(k)=norm(dfxk,2);

% la�o
while ~(norma(k)<=toler)
    X(:,k)=x;
 
    p=-H*dfxk;                 % dire��o de descida
    
    f(k)=fx(x);                % valor atual da fun��o objetivo
    if k~=1
        alpha0=2*(f(k)-f(k-1))/(dfxk'*p);
    else
        alpha0=1;
    end    
    [alpha(k),i(k)]=btls(x,alpha0,p,dfxk,f(k)); % backtracking line search
    
    x=x+alpha(k)*p;            % atualiza��o de x
    
    % c�lculo da matriz H
    s=alpha(k)*p;
    dfxk_old=dfxk;
    dfxk=dfx(x);
    y=dfxk-dfxk_old;
    ro(k)=1/(y'*s);
    if k~=1 %&& s'*y>toler/10000
        H=(I-ro(k)*s*y')*H*(I-ro(k)*y*s')+ro(k)*s*s';
        h=h+1;       %  contador de atualiza��es de H
    elseif k==1
        H=((y'*s)/(y'*y))*I;
        H=(I-ro(k)*s*y')*H*(I-ro(k)*y*s')+ro(k)*s*s';
    end
    
    k=k+1;
    
    norma(k)=norm(dfxk,2);     % norma 2 do gradiente
end

% etapa final
X(:,k)=x;
f(k)=fx(x);                % valor da fun��o objetivo
k=k-1;                     % n�mero total de itera��es