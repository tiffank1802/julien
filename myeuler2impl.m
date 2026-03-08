% Program 6.2  Vector version of Euler method
% Input: interval [a,b], initial value y0, step size h
% Output: time steps t, solution y
% Example usage: 
% [t,y]=myeuler2([0 1],[0 1],0.1);

function [t,y]=myeuler2impl(int,y0,h)
t(1)=int(1); y(1,:)=y0;
n=round((int(2)-int(1))/h);
for i=1:n
  t(i+1)=t(i)+h;
  % y(i+1,:)=eulerstepbackward(t(i),y(i,:),h);
  y(i+1,:)=granknicolson(t(i),y(i,:),h);
end
end

% function w=eulerstepbackward(t,y,h)
% %one step of the Euler backward (implicit) method
% %Input: current time t, current vector y, step size h
% %Output: the approximate solution vector at time t+h
% pkg load symbolic  % Charger le package (si pas déjà fait)
% syms w1 w2
% eqn1 = w1+h*pi^2*w2==y(1);
% eqn2 = -h*w1+w2==y(2);
% sol = solve([eqn1,eqn2],[w1,w2]);
% w(1)=eval(sol.w1);
% w(2)=eval(sol.w2);
function w = eulerstepbackward(t, y, h)
% Une étape de la méthode d'Euler implicite
% Version numérique optimisée pour votre système

    % Matrice du système linéaire
    % w1 + h*pi^2*w2 = y(1)
    % -h*w1 + w2 = y(2)
    A = [1, h*pi^2;
    -h, 1];
    
    % Résolution
    w = A \ y';

end
function w = granknicolson(t, y, h)
omega=pi;
A1=[1 -omega^2*h/2;
h/2 1];
A2=[1 omega^2*h/2;
-h/2 1]^(-1);
A=A1*A2;
w=A\y';
end
function w=granknicolson2(t,y,h)
omega=pi;
I=ones(4);
A=[
  0 0 -omega^2 0;
  0 0 0 -omega^2;
  1 0 0 0;
  0 1 0 0

];
A1=(I-(h/2)*A);
A2=(I+(h/2)*A);
w=A1^(-1)*A2\y'
end