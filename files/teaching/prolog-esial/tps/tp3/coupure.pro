s(a).
s(b).
t(a,b).
t(b,a).

p1(X,Y):- s(X),t(Y,X).
p1(a,a).

p2(X,Y):- s(X),t(Y,X),!.
p2(a,a).

p3(X,Y):- s(X),!,t(Y,X).
p3(a,a).

p4(X,Y):- !,s(X),t(Y,X).
p4(a,a).
