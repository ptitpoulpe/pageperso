decompte_solutions(N,N1,N2,N3):-
     findall(L1,n_reines(N,L1),L11),
     length(L11,N1),
     findall(L2,n_reines_sym_h(N,L2),L22),
     length(L22,N2),
     findall(L3,n_reines_sym_h_v(N,L3),L33),
     length(L33,N3).
