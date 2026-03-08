Tmax=1;
myint=[0 1];
myh=.2; % pas de temps choisi
y0=1; % Conditions initiales
myhs=[1,1/2,1/3,1/4,1/5,1/6];
n= round((myint(2)-myint(1))/myh);
piquetsqtemps=myint(1):((myint(2)-myint(1))/n):myint(2);
yref=3*exp((piquetsqtemps.^2)/2)-piquetsqtemps.^2-2;


for i=1:4
subplot(2,2,i)
hold on 

[t,y_app]=myrk4(myint,y0,myhs(i));
plot(piquetsqtemps,yref,"red") % trace la solution analytique
plot(t,y_app,"blue") %trace la soltution approchée 
legend("approchée","analytique")
hold off
end
% e=abs(yref-y_app)
% e(end);
% plot(piquetsqtemps,log(e))

% pente=(log(e)(end)-log(e)(1)) % on constate que la pente pour un RK4 est sensiblemente de 4
%                                 % tracer de la pente   au cours du temps