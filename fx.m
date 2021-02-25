%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fx.m: Cálculo do valor da função objetivo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function f = fx(x)

% global Y
% f=0;
% t=0.02*[1:45]';
% 
% f = sum(0.5*(Y-(x(3)*exp(x(1)*t)+x(4)*exp(x(2)*t))).^2);
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

t=x(1);
FI=x(2);

X=sqrt(2)*Vrms/L1; 
Y=w*cos(FI).*(2*A*cos(w*t+Oa)+B*exp(-r1*t/L1));
Z=sin(FI).*(2*A*w*cos(w*t+Oa)+(r1/L1)*B*exp(-r1*t/L1));

i=X*(Y-Z);

f=-i;