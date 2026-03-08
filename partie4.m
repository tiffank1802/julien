% -- Script Principal : partie4.m --

clear all; close all; clc;

myint = [0 3];
myh = 0.2; % pas de temps choisi
y0 = [0 0 1 1]; % Conditions initiales (vecteur ligne)

% Calcul du nombre de pas et du vecteur temps
n = round((myint(2) - myint(1)) / myh);
piquetsqtemps = myint(1):myh:myint(2);

% Initialisation du stockage des résultats
% On crée une matrice vide avec le bon nombre de lignes
y_stock = zeros(n+1, 4); 
y_stock(1, :) = y0; 

% Boucle temporelle
y_curr = y0;
for k = 1:n
    % Appel de la fonction pour le pas suivant
    % Note : y_curr doit être transformé en vecteur ligne pour le stockage
    y_next = crank_nicolson([], y_curr, myh)'; 
    
    % Stockage
    y_stock(k+1, :) = y_next;
    
    % Mise à jour pour l'itération suivante
    y_curr = y_next;
end

% Tracé des résultats
omega0 = pi; % D'après votre code
yref = cos(omega0 .* piquetsqtemps);

figure;
hold on
plot(piquetsqtemps, yref, "blue", 'LineWidth', 1.5)
plot(piquetsqtemps, y_stock(:,end), "red", 'LineWidth', 1.5) % On trace la 2ème composante
legend("analytique", "approchée")
title("Comparaison Solution Analytique / Crank-Nicolson")
hold off