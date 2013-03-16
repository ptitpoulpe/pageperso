chemin(vienne,moscou).
chemin(vienne,berlin).
chemin(rome,vienne).
chemin(rome,berlin).
chemin(paris,berlin).
chemin(paris,rome).
chemin(madrid,paris).
chemin(paris,londres).

voyage(V,V,[]).
voyage(V1,V2,[V|Q]):-chemin(V1,V), voyage(V,V2,Q).

pluslongue([_|_],[]).
pluslongue([_|Q1], [_|Q2]):-pluslongue(Q1,Q2).

lapluscourte([L], L).
lapluscourte([L|Q], L):-pluslongue(L2,L), lapluscourte(Q,L2). 
lapluscourte([L|Q], L2):-pluslongue(L,L2), lapluscourte(Q,L2).

lepluscourtvoyage(V1,V2,L):-findall(L1, voyage(V1,V2,L1), L2), lapluscourte(L2,L).
