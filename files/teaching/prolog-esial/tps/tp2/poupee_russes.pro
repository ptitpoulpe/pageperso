directementDans(irina,natasha).
directementDans(natasha,olga).
directementDans(olga,katarina).
dans(X,Y):- directementDans(X,Y).
dans(X,Y):- directementDans(X,Z), dans(Z,Y).
