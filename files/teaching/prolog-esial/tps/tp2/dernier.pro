dernier([X], X).
dernier([_|Q], X):-dernier(Q, X).
