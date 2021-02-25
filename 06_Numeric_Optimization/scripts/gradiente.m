%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% gradiente.m: Otimização via Método do Gradiente
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

toler=1e-2; % tolerância

% inicialização
k=1;
f(k)=fx(x);
dfxk=dfx(x);
norma(k)=norm(dfxk,2);

% laço
while ~(norma(k)<=toler)
    X(:,k)=x;
    
    p=-dfxk;                   % direção de descida
    keyboard
    f(k)=fx(x);                % valor atual da função objetivo
    if k~=1
        alpha0=alpha(k-1)*(dfxkm1'*pkm1)/(dfxk'*p);
    else
        alpha0=1;
    end
    dfxkm1=dfxk;
    pkm1=p;
    [alpha(k),i(k)]=btls(x,alpha0,p,dfxk,f(k)); % backtracking line search
    
    x=x+alpha(k)*p;            % atualização de x
    
    k=k+1;
    
    dfxk=dfx(x);
    norma(k)=norm(dfxk,2);     % norma 2 do gradiente
 
    keyboard

end

% etapa final
X(:,k)=x;
f(k)=fx(x);                % valor da função objetivo
k=k-1;                     % número total de iterações