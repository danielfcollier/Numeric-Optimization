%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% hessiana.m: Hessiana da função objetivo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function H = hessiana(x)

global Y
H=zeros(4,4);
t=0.02*[1:45]';

aux=Y-(x(3)*exp(x(1)*t)+x(4)*exp(x(2)*t));

H(1,1)=sum((x(3)*t.*exp(x(1)*t)).^2+aux.*(-x(3)*t.^2.*exp(x(1)*t)));
H(1,2)=sum(x(3)*x(4)*t.^2.*exp(x(1)*t+x(2)*t));
H(1,3)=sum(x(3)*t.*exp(2*x(1)*t)+aux.*(-t.*exp(x(1)*t)));
H(1,4)=sum(x(3)*t.*exp(x(1)*t+x(2)*t));
H(2,2)=sum((x(4)*t.*exp(x(2)*t)).^2+aux.*(-x(4)*t.^2.*exp(x(2)*t)));
H(2,3)=sum(x(4)*t.*exp(x(1)*t+x(2)*t));
H(2,4)=sum(x(4)*t.*exp(2*x(2)*t)+aux.*(-t.*exp(x(2)*t)));
H(3,3)=sum(exp(x(1)*t).^2);
H(3,4)=sum(exp(x(1)*t+x(2)*t));
H(4,4)=sum(exp(x(2)*t).^2);

H(2,1)=H(1,2);
H(3,1)=H(1,3);
H(3,2)=H(2,3);
H(4,1)=H(1,4);
H(4,2)=H(2,4);
H(4,3)=H(3,4);