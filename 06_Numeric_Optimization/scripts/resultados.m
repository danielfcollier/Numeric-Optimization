%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% resultados.m: Apresentação dos resultados
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% figure(1); t=0.02*[1:45]; plot(t,Y,'m')
% hold on; grid on
% Yfitp1=xp1(3)*exp(xp1(1)*t)+xp1(4)*exp(xp1(2)*t);
% Yfitp2=xp2(3)*exp(xp2(1)*t)+xp2(4)*exp(xp2(2)*t);
% Yfitp3=xp3(3)*exp(xp3(1)*t)+xp3(4)*exp(xp3(2)*t);
% plot(t,Yfitp1,'b'); plot(t,Yfitp2,'r');plot(t,Yfitp3,'g')
% legend('Medição', 'Ajuste 1', 'Ajuste 2', 'Ajuste 3')
% xlabel('tempo (s)'); ylabel('Magnitude')

% figure(2); plot(0:k,norma); grid on
% xlabel('Iterações'); ylabel('Valor da norma')
% title('Evolução da norma ao longo do processo iterativo')
% 
figure(3); plot(1:k,alpha,'g'); hold on; legend('3'); grid
a=find(i); plot(a,alpha(a),'k*')
xlabel('Iterações'); ylabel('Alpha')
title('Evolução de alpha ao longo do processo iterativo')
% 
% figure(4); plot(0:k,f); grid on
% xlabel('Iterações'); ylabel('Valor da função objetivo')
% title('Evolução do valor da função objetivo ao longo do processo iterativo')
% 
% figure(5); plot(0:k,eigmin); grid on
% xlabel('Iterações'); ylabel('Menor auto-valor de H')
% title('Evolução do menor auto-valor de H ao longo do processo iterativo')
% figure(5); plot(1./ro); grid on
% xlabel('Iterações'); ylabel('Valor da função objetivo')
% title('Evolução do valor da função objetivo ao longo do processo iterativo')

disp(' ')
disp('Valor da função objetivo'); disp(f(k+1))
disp('Valor da norma 2 do gradiente'); disp(norma(k+1))
disp('Tolerância do método'); disp(toler)
disp('Número de iterações'); disp(k)
disp('Número de interpolações'); disp(sum(i))
disp('Número máximo de interpolações'); disp(max(i))