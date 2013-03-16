num_diag(L1,L2) :- num_diag(L1,L2,1).
num_diag([],[],_).
num_diag([X|Q],[X1|Q1],N):-
   X1 #= X+N,
   N1 is N+1,
   num_diag1(Q,Q1,N1).
