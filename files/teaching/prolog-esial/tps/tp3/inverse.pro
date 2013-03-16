inverse(L,R):- accInv(L,[],R).

accInv([T|Q],A,R):- accInv(Q,[T|A],R).
accInv([],A,A).
