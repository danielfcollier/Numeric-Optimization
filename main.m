%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% main.m: Rotina Principal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all; clc; clf; close all
format long
%
%
%
disp('              EEL6000 - M�todos Num�ricos de Otimiza��o                ')
disp('                       Trabalho Computacional                          ')
disp('                   Daniel Augusto Figueiredo Collier                   ')
disp('                                                                       ')
disp('                                                                       ')
%
%   Entrada de Dados
%
% x = input('Entre com o ponto inicial x0: ');
% disp(' ')
x=[0.01 -0.5]';
% disp('(1) Gradiente (2) Q-Newton (3) Newton-GC');
% v=input('Escolha o m�todo de otimiza��o: ');
% disp(' ')
v=1;
% % % % % dados
%
%   Otimiza��o via m�todo escolhido
%  
if v==1
    tic
    gradiente
    toc
elseif v==2
    tic
    qnewton
    toc
elseif v==3
    tic
    gcnewton
    toc
end
% 
% Apresenta��o dos resultados
%
% resultados