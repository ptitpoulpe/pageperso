n_reines_sym_h_v(N,L):-
      length(L,N),
      fd_domain(L,1,N),
      fd_all_different(L),
      num_diags(L,D1,D2),
      fd_all_different(D1),
      fd_all_different(D2),
      L = [C1|Q],
      Q = [C2|_],
      C1#=<C2,
      C1#=<(N+1) // 2,
      fd_labeling(L).
