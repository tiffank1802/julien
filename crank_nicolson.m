function w = granknicolson2(t, y, h)
    % Définition des paramètres
    omega = pi;
    
    % Matrice identité 4x4
    I = eye(4); 
    
    % Matrice du système
    A = [0 0 -omega^2 0;
         0 0 0 -omega^2;
         1 0 0 0;
         0 1 0 0];

    % Schéma de Crank-Nicolson
    A1 = (I - (h/2)*A);
    A2 = (I + (h/2)*A);
    
    % Calcul de l'itération suivante
    % Note : y est passé en ligne ici, le résultat w sera un vecteur colonne
    w = A1^(-1) * A2 * y';
end