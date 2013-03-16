
acote(X,Y):-acote(Y,X)!.

couleur(X,Y,Z):-acote(X,Y), acote(Y,Z).
