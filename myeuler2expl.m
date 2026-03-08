% Program 6.2  Vector version of Euler method
% Input: interval [a,b], initial value y0, step size h
% Output: time steps t, solution y
% Example usage: 
% [t,y]=myeuler2([0 1],[0 1],0.1);

function [t,y]=myeuler2expl(int,y0,h)
t(1)=int(1); y(1,:)=y0;
n=round((int(2)-int(1))/h);
for i=1:n
  t(i+1)=t(i)+h;
  y(i+1,:)=y(i,:)+eulerstepforward(t(i),y(i,:),h);
end

function y=eulerstepforward(t,y,h)
%one step of the Euler forward method
%Input: current time t, current vector y, step size h
%Output: the approximate solution vector at time t+h
y=h*ydot(t,y);

function z=ydot(t,y)
z(1) = -pi^2*y(2);  % on a choisi omega0=pi
z(2) = y(1);
