%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% main.m: Rotina Principal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all; clc; clf; close all
format long
%
%
%
disp('              EEL6000 - Métodos Numéricos de Otimização                ')
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
% v=input('Escolha o método de otimização: ');
% disp(' ')
v=1;
% % % % % dados
%
%   Otimização via método escolhido
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
% Apresentação dos resultados
%
% resultados