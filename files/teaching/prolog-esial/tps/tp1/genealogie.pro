parents(paul, marie, pierre).
parents(paul, marie, herve).
parents(pierre, sophie, eric).
parents(pierre, claire, diane).
parents(herve, camille, david).
parents(eric, sylvie, guillaume).
parents(david, diane, christian).

homme(X):-parents(X,_,_).
femme(X):-parents(_,X,_).
pere(X,Y):-parents(X,_,Y).
mere(X,Y):-parents(_,X,Y).
parent(X,Y):-pere(X,Y);mere(X,Y).
ancetre(X,Y):-parent(X,Y).
ancetre(X,Y):-parent(X,Z),ancetre(Z,Y).
famille(X,Y):-ancetre(Z,X),ancetre(Z,Y).
