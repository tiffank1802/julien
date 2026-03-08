clear all
close all

% parametrage du probleme a resoudre 
k0 = (2/(3-sqrt(5))); m0 = 1;
eta = 0.3;
% eta = 0.;
myK = [2*k0 -k0; -k0  k0];
myM = [m0 0; 0 m0];
myC = eta*myK;
deplinit = [1 (1+sqrt(5))/2]; % conditions initiales mode 1
% deplinit = [1 (1-sqrt(5))/2]; % conditions initiales mode 2
% deplinit = [1 0];
velinit = [0 0]; 
% conditions initiales

% parametres necessaires au schema
%   - valeurs propres et periodes propres associees
omegamin = sqrt(((3-sqrt(5))/2)*(k0/m0)); periodeOmegamin = 2*pi/omegamin;
omegamax = sqrt(((3+sqrt(5))/2)*(k0/m0)); periodeOmegamax = 2*pi/omegamax;
%   - duree d'observation
Tmax = 10*periodeOmegamin;
myint = [0 Tmax];
%    - choix du pas de temps
myh = (3.464/omegamax)/200  ;  % pas de temps choisi
myh=204*myh;
% myh=0.7;
%
% vecteur force applique au cours du temps, à chaque degre de liberte
n = length(myM) ; % nombre de degré de liberte
nt = fix((myint(2)-myint(1))/myh) ; % nombre de pas de temps
myF =  zeros(n,nt+1) ;
%
% type de schema 
%    beta = 0.25, gamma = 0.5 : acceleration centrale
%    beta = 0, gamma = 0.5 : differences centrees
beta = 1/6;
gaama = 0.5;

% appel de la fonction d'integration par Newmark
[t,depl,vel,accl] = mynewmark(myint,myh,myM,myK,myC,myF,gaama,beta,deplinit,velinit);

% trace de la solution en deplacement
vectdepl=depl';
figure
plot(t,vectdepl(:,1),"blue"); hold on;
plot(t,vectdepl(:,2),"green"); hold on;
% legend("noeud1_cal","noeud1_anal")


% solution exacte pour le cas non amorti avec condition initiale ciblant le  1er mode
%
deplref = cos(omegamin.*t).*[1 ; (1+sqrt(5))/2];
vectdeplref=deplref';
% plot(t,vectdeplref(:,1),"r--"); hold on;
% plot(t,vectdeplref(:,2),"m--"); hold on;
% legend("noeud1_c","noeud2_c","noeud1_a","noeud2_a")
% legend("noeud1_c","noeud1_a")
legend("noeud1","noeud2")
title("Deplacement des noeuds masse 1")
erreur1=vectdeplref-vectdepl;
max(erreur1)
hold off
% figure
% hold on
% plot(erreur1(:,1))
% plot(erreur1(:,2))
% hold off
% legend("masse1","masse2")
% title("Erreur sur les masse ")

omegamin;
periodeOmegamin;
omegamax; 
periodeOmegamax;




