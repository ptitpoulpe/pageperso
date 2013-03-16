occurrence(X,[T|Q],N) :- X == T, ! , occurrence(X,Q,N1), N is N1 + 1. 
occurrence(X,[_|Q],N) :- !, occurrence(X,Q,N). 
occurrence(_,[],0). 

occurrence2(X,[X|Q],N) :- !, occurrence2(X,Q,N1), N is N1 + 1. 
occurrence2(X,[_|Q],N) :- !, occurrence2(X,Q,N). 
occurrence2(_,[],0). 
