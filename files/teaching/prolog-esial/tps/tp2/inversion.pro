% inverse sans accumulateur
inverse([], []).
inverse([T1|Q1], L2):-inverse(Q1,Q2), append(Q2,[T1],L2).

% palindrome
palindrome(L):-inverse(L, L).

% dernier inverse
dernier(L, X):-inverse(L, [X|_]).
