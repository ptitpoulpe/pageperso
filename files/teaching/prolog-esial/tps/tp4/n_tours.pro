ntours(N,L) :-
      length(L,N),
      fd_domain(L,1,N),
      fd_all_different(L),
      fd_labeling(L).
