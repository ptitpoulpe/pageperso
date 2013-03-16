pluslongue([_|_],[]).
pluslongue([_|Q1], [_|Q2]):-pluslongue(Q1,Q2). 

lapluslongue([L], L).
lapluslongue([L1|Q], L1):-pluslongue(L1,L2),lapluslongue(Q,L2).                 
lapluslongue([L1|Q], L2):-pluslongue(L2,L1), lapluslongue(Q,L2).
