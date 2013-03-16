p(X,Y) :- q(X,Y,X).
p(X,X) :- s(Y), q(X,Y,X).

q(X,Y,Z) :- X < 4, r(Y,Z).
q(X,X,X) :- s(Y), !, r(X,Y).
q(X,Y,Z) :- X < 2, r(Z,Y).

r(X,Y) :- X == Y-2.
r(X,X).

s(1).
s(2).
s(3).
