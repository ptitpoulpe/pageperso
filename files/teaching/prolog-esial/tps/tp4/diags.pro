num_diags(L1,L2,L3) :- length(L1, N), num_diags(L1,L2,L3,1,N).

num_diags([],[],[],_,_).
num_diags([X|Q],[X1|Q1],[X2|Q2],N,M):-
     X1#=X+N,
     X2#=X+M,
     N1 is N+1,
     M1 is M-1,
     num_diags(Q,Q1,Q2,N1,M1).
