% horizontales:
ligne([1,2,3]).
ligne([4,5,6]).
ligne([7,8,9]).

% verticales:
ligne([1,4,7]).
ligne([2,5,8]).
ligne([3,6,9]).

% diagonale:
ligne([1,5,9]).
ligne([3,5,7]).

vide(Case,Plateau) :- arg(Case,Plateau,Val), var(Val). 
croix(Case,Plateau) :- arg(Case,Plateau,Val), nonvar(Val), Val = x. 
rond(Case,Plateau) :- arg(Case,Plateau,Val), nonvar(Val), Val = o. 

menace([X,Y,Z],Plateau,X) :- vide(X,Plateau), croix(Y,Plateau), croix(Z,Plateau). 
menace([X,Y,Z],Plateau,Y) :- vide(Y,Plateau), croix(X,Plateau), croix(Z,Plateau). 
menace([X,Y,Z],Plateau,Z) :- vide(Z,Plateau), croix(X,Plateau), croix(Y,Plateau). 

mouvement_obligatoire(Plateau,Case_a_jouer) :- ligne(Liste_cases),
                                               menace(Liste_cases,Plateau,Case_a_jouer),
                                               !. 
