%Program 6.1 Euler's Method for Solving Initial Value Problems
%Use with ydot.m to evaluate rhs of differential equation
% Input: interval [a,b], initial value y0, step size h
% Output: time steps t, solution y
% Example usage: 
%  [t,y]=myeuler1([0 1],1,0.1);
function [t,y]=myeuler1(int,y0,h)
t(1)=int(1); y(1)=y0;
n=round((int(2)-int(1))/h);
for i=1:n
  t(i+1)=t(i)+h;
  % y(i+1)=eulerstep(t(i),y(i),h);
  y(i+1)=eulerstep(t(i),y(i,:),h);
end
plot(t,y)

end

function y=eulerstep(t,y,h)
%one step of Euler's Method
%Input: current time t, current value y,  stepsize h
%Output: approximate solution value at time t+h
% y=y+h*ydot(t,y);
y=h*ydot(t,y)
end 

function z=ydot(t,y)
%z = t*y + t^3;
% z = t*y+t^3;
z=-15*y;
% z(1)=-pi^2*y(2); % on  a choisi omega=pi
% z(2)=y(1);
end

