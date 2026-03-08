% Calls a one-step method such as rk4step.m
function [t,y]=myrk4(int,y0,h)
t(1)=int(1); y(1)=y0;
n=round((int(2)-int(1))/h);
for i=1:n
  t(i+1)=t(i)+h;
  y(i+1)=rk4step(t(i),y(i),h);
end
% plot(t,y)

function y=rk4step(t,w,h)
%one step of the Runge-Kutta order 4 method
s1=ydot(t,w);
s2=ydot(t+h/2,w+h*s1/2);
s3=ydot(t+h/2,w+h*s2/2);
s4=ydot(t+h,w+h*s3);
y=w+h*(s1+2*s2+2*s3+s4)/6;

function z = ydot(t,y)
z = t*y + t^3;
