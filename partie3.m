
myint=[0 3];
myh=.2; % pas de temps choisi
y0=[0 1]; % Conditions initiales

n= round((myint(2)-myint(1))/myh);
piquetsqtemps=myint(1):((myint(2)-myint(1))/n):myint(2);
omega0=pi;
yref=cos(omega0.*piquetsqtemps);
[t,y]=myeuler2impl(myint,y0,myh);
hold on
plot(piquetsqtemps,yref,"blue")
plot(t,y(:,2),"red")
legend("analytique","approchée")
hold off
