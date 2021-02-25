%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% gcnewton.m: Otimiza��o via M�todo Newton-GC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

toler=1e-6; % toler�ncia do m�todo

% inicializa��o
k=1;
dfxk=dfx(x);
norma(k)=norm(dfxk,2);
f(k)=fx(x);
r=0; c=0;

% la�o
while ~(norma(k)<=toler)
    X(:,k)=x;
    
    Hes=hessiana(x);           % matriz hessiana em x
    [p,kr,kc]=gcl(Hes,-dfxk,norma(k)); % dire��o de descida pelo m�todo do GCL
    r=r+kr;
    c=c+kc;
    
    f(k)=fx(x);                % valor atual da fun��o objetivo
    if k~=1
        alpha0=2*(f(k)-f(k-1))/(dfxk'*p);
    else
        alpha0=1;
    end
    [alpha(k),i(k)]=btls(x,alpha0,p,dfxk,f(k)); % backtracking line search
    
    x=x+alpha(k)*p;            % atualiza��o da vari�vel
    
    k=k+1;
    
    dfxk=dfx(x);
    norma(k)=norm(dfxk,2);     % norma 2 do gradiente
end

% etapa final
X(:,k)=x;
f(k)=fx(x);                % valor da fun��o objetivo
k=k-1;                     % n�mero total de itera��es