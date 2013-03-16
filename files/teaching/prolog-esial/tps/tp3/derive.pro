derive(X,X,1) :- !. 
derive(C,_,0) :- atomic(C). 
derive(-U,X,-A) :- derive(U,X,A). 
derive(U+V,X,A+B) :- derive(U,X,A), derive(V,X,B). 
derive(U-V,X,A-B) :- derive(U,X,A), derive(V,X,B). 
derive(C*U,X,C*A) :- atomic(C), C \= X, derive(U,X,A), !. 
derive(U*V,X,B*U+A*V) :- derive(U,X,A), derive(V,X,B). 
derive(U/V,X,A) :- derive(U*V**(-1),X,A). 
derive(U**C,X,C*U**(C-1)*W) :- atomic(C), C \= X, derive(U,X,W). 

simp(E,E) :- atomic(E), !. 
simp(E,F) :- E =.. [Op,G,D], simp(G,X), simp(D,Y), change(Op,X,Y,F). 

change(+,X,0,X). 
change(+,0,X,X). 
change(+,X,Y,Z) :- integer(X), integer(Y), Z is X + Y. 
change(+,X,Y,X+Y). 
change(*,_,0,0). 
change(*,0,_,0). 
change(*,1,X,X). 
change(*,X,1,X). 
change(*,X,Y,X*Y). 
