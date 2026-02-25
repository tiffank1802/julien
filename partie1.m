% Paramètres necessaires
Tmax=1;
myint=[0 1];
myh=1/7; % pas de temps choisi
y0=1; % Conditions initiales



% paramètres pour construire la reference 1
n= round((myint(2)-myint(1))/myh);
piquetsqtemps=myint(1):((myint(2)-myint(1))/n):myint(2);
yref=3*exp((piquetsqtemps.^2)/2)-piquetsqtemps.^2-2;

% plot(piquetsqtemps,yref,"red")
grid on
% hold on

[t,yappeul]=myeuler1(myint,y0,myh)
% plot(piquetsqtemps,yappeul,"blue")
% hold off