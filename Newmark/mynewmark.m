% NEWMARK'S METHOD : LINEAR SYSTEM
% Purpose : Dynamic Response of a system using linear Newmark's Method
% Use : [depl,vel,accl,U,t] = NewmarkMethod(M,K,C,P,phi,sdof,gaama,beta)
%
% INPUT :
% M: Mass Matrix; K: Stiffness Matrix; C: Damping Matrix; P: Force Vector
% gaama, beta - Type of Newmark's Method to be used 
%       
% OUTPUT :
% depl - vel - accl: system's displacement, velocity, acceleration
% t - time values at which integration is done
%--------------------------------------------------------------------------

function [t,depl,vel,accl] = mynewmark(int,h,M,K,C,F,gaama,beta,deplinit,velinit)
ti=int(1); tf=int(2);
n=round((int(2)-int(1))/h);
%
% Useful matrices
Mcorrigee = M+gaama*h*C+beta*h^2*K;
%
% Time step
t = ti:h:tf ;
nt = fix((tf-ti)/h) ;
n = length(M) ;
%
% Initialisation
depl = zeros(n,nt);
vel = zeros(n,nt); 
accl = zeros(n,nt); 
%
% Initial Conditions
depl(:,1) = deplinit;
vel(:,1) = velinit;
accl(:,1) = M\(F(:,1)-C*vel(:,1)-K*depl(:,1)); % equilibre instant 1
%
% Recurrence
for i = 1:nt
    accl(:,i+1) = Mcorrigee\(F(:,i+1)-C*((vel(:,i)+(1-gaama)*h*accl(:,i)))-K*(depl(:,i)+h*vel(:,i)+(0.5-beta)*h^2*accl(:,i)));
    delv = h*((1-gaama)*accl(:,i)+gaama*accl(:,i+1));
    delu = h*vel(:,i)+0.5*h^2*((1-2*beta)*accl(:,i)+2*beta*accl(:,i+1));
       depl(:,i+1) = depl(:,i)+delu ;
       vel(:,i+1) = vel(:,i)+delv ;
 
end


