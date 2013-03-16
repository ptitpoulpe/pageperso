n_reines(N,L):-
      length(L,N),
      fd_domain(L,1,N),
      fd_all_different(L),
      num_diags(L,D1,D2),
      fd_all_different(D1),
      fd_all_different(D2),
      fd_labeling(L).
