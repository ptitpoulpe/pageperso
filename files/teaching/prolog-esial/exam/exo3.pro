
%lehnhard
encode_buff([T|Q], [], X, S) :- encode_buff(Q, [1,T], X, S).
encode_buff([T|Q], [NB,T], X, S) :- N is NB + 1, encode_buff(Q, [N,T], X, S), !.
encode_buff([T|Q], E, X, S) :- encode_buff([T|Q], [], Y, S), append([E],X,Y).
encode_buff([], E, X, S) :- append([E],X,S).

%jaquet
occ_addj([], _, 0, _).
occ_addj([A|L], A, N, L) :- occ_addj(L,A,Y,_), N is Y +1.
occ_addj([A|L], X, 0, L).

%sarzyniec
encacc([], Acc, R).
encacc([X,X|Q], Acc, R) :- NewAcc is Acc + 1, encacc([X|Q], NewAcc, R).
encacc([X|Q], Acc, [[X,EndAcc]|R]) :- EndAcc is Acc+1, encacc(Q, 0, R).

%cyganczuk
enc([],[[0,T]]).
enc([T|Q],[[NN,T]|X]) :- enc(Q,[[N,T]|X]), NN is N + 1.
enc([NT|Q],[[0,T],[NNN,NT]|X]) :- enc(Q,[[NN,NT]|X]), NNN is NN + 1.


