% Harry est un magicien
magicien(harry).
% Hagrid fait peur à Dudley 
fait_peur(hagrid, dudley).
% Tous les magiciens sont magiques
magique(X):-magicien(X).
% L'oncle Vernon déteste tout ce qui est magique.
deteste(vernon, X):-magique(X).
% La tante Pétunia déteste tout ce qui est magique ou fait peur à Dudley.
deteste(petunia, X):-magique(X);fait_peur(X, dudley).


% Est­ce que Pétunia déteste Hagrid ? (oui)
%   deteste(petunia, hagrid).
% Qui l'oncle Vernon déteste­t'il ? (Harry)
%   deteste(vernon, X).
% Qui la tante Pétunia déteste­t'elle ? 
%   deteste(petunia, X).
