max1(X,Y,X):- X >= Y.
max1(X,Y,Y):- X < Y.

max2(X,Y,X):- X >= Y, !.
max2(X,Y,Y):- X < Y.

max3(X,Y,X):- X >= Y,!.
max3(X,Y,Y).

max4(X,Y,Z):- X >= Y,!, Z = X.
max4(X,Y,Y).

% max*(1,2,X).
% max*(4,2,X).
% max*(4,2,2).
