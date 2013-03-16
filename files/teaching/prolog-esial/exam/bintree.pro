membre(X,bin(X,_,_)).
membre(X,bin(_,L,R)):- membre(X,L);membre(X,R).

nbfeuilles(nil,0).
nbfeuilles(bin(_,nil,nil),1):-!.
nbfeuilles(bin(_,X,Y),Z):- nbfeuilles(X,NX), nbfeuilles(Y,NY), Z is NX + NY.

max(X,Y,X):- X >= Y, !.
max(X,Y,Y):- X < Y.

hauteur(nil,0).
hauteur(bin(_,X,Y),Z):- hauteur(X,HX), hauteur(Y,HY), max(HX,HY,T), Z is T + 1.

sym(bin(_,nil,nil)).
sym(bin(_,bin(S,LX,RX),bin(S,LY,RY))):- sym(bin(S,LX,RX)), sym(bin(S,LY,RY)),!.

sym2(bin(_,nil,nil)).
sym2(bin(_,bin(S,LX,RX),bin(S,LY,RY))):- sym2(bin(S,LX,RY)), sym2(bin(S,LY,RX)),!.

% membre(E,bin(a,nil,nil)).
% membre(E,bin(a,bin(e,nil,nil),bin(i,nil,nil))).
% 
% nbfeuilles(bin(a,nil,nil), E).
% nbfeuilles(bin(a,bin(e,nil,nil),bin(i,nil,nil)), E).
% nbfeuilles(bin(a,bin(e,nil,nil),E),2).
% 
% hauteur(bin(a,nil,nil), E).
% hauteur(bin(a,bin(e,nil,nil),bin(i,nil,nil)), E).
% hauteur(bin(a,bin(e,nil,nil),E),2).
% 
% bin(a,bin(e,bin(f,nil,nil),nil),bin(e,nil,bin(f,nil,nil)))
% 
% sym(bin(a,nil,nil)).
% sym(bin(a,bin(e,nil,nil),bin(i,nil,nil))).
% sym(bin(a,bin(e,bin(f,nil,nil),nil),bin(e,nil,bin(f,nil,nil)))).
% sym2(bin(a,bin(e,bin(f,nil,nil),nil),bin(e,nil,bin(g,nil,nil)))).
% sym2(bin(a,bin(e,bin(f,nil,nil),nil),bin(e,bin(f,nil,nil),nil))).
