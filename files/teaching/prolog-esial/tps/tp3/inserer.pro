inserer(X,[],[X]).
inserer(X,[T|Q],[T,Q2]) :- X > T, inserer(X,Q,Q2).
inserer(X,[T|Q],[X,T,Q]) :- X =< T.
