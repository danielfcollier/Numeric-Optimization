%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% gcnewton.m: Otimização via Método Newton-GC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

toler=1e-6; % tolerância do método

% inicialização
k=1;
dfxk=dfx(x);
norma(k)=norm(dfxk,2);
f(k)=fx(x);
r=0; c=0;

% laço
while ~(norma(k)<=toler)
    X(:,k)=x;
    
    Hes=hessiana(x);           % matriz hessiana em x
    [p,kr,kc]=gcl(Hes,-dfxk,norma(k)); % direção de descida pelo método do GCL
    r=r+kr;
    c=c+kc;
    
    f(k)=fx(x);                % valor atual da função objetivo
    if k~=1
        alpha0=2*(f(k)-f(k-1))/(dfxk'*p);
    else
        alpha0=1;
    end
    [alpha(k),i(k)]=btls(x,alpha0,p,dfxk,f(k)); % backtracking line search
    
    x=x+alpha(k)*p;            % atualização da variável
    
    k=k+1;
    
    dfxk=dfx(x);
    norma(k)=norm(dfxk,2);     % norma 2 do gradiente
end

% etapa final
X(:,k)=x;
f(k)=fx(x);                % valor da função objetivo
k=k-1;                     % número total de iterações