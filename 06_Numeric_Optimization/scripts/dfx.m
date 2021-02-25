%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% dfx.m: Cálculo do gradiente da função objetivo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function df = dfx(x)

% global Y
% df=zeros(4,1);
% t=0.02*[1:45]';
% 
% df=[ (Y-(x(3)*exp(x(1)*t)+x(4)*exp(x(2)*t)))'*(-x(3)*t.*exp(x(1)*t))
%      (Y-(x(3)*exp(x(1)*t)+x(4)*exp(x(2)*t)))'*(-x(4)*t.*exp(x(2)*t))
%      (Y-(x(3)*exp(x(1)*t)+x(4)*exp(x(2)*t)))'*(-exp(x(1)*t))
%      (Y-(x(3)*exp(x(1)*t)+x(4)*exp(x(2)*t)))'*(-exp(x(2)*t))
% ];

Vrms=110;
r1=12;
Ll1=27.1e-3;
Lm1=262.9e-3;
fs=60;

L1=Ll1+Lm1;
w=2*pi*fs;

Oa=-pi/2-atan(w*L1/r1);
B=1/((r1/L1)^2+w^2);
A=sqrt(B)/2/w;

tal=L1/r1;

t=x(1);
FI=x(2);

X=sqrt(2)*Vrms/L1; 

df=zeros(2,1);

Y1=w*cos(FI).*(-2*A*w*sin(w*t+Oa)-(B/tal)*exp(-t/tal));
Z1=sin(FI).*(2*A*w^2*cos(w*t+Oa)-(B/(tal^2))*exp(-t/tal));

df(1)=-X*(Y1-Z1);

Y2=-w*sin(FI).*(2*A*cos(w*t+Oa)+B*exp(-t/tal));
Z2=cos(FI).*(2*A*w*sin(w*t+Oa)+(B/tal)*exp(-t/tal));

df(2)=-X*(Y2-Z2);


f=i;