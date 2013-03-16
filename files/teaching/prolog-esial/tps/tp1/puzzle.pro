mot(abalone,a,b,a,l,o,n,e).
mot(abandon,a,b,a,n,d,o,n).
mot(enhance,e,n,h,a,n,c,e).
mot(anagram,a,n,a,g,r,a,m).
mot(connect,c,o,n,n,e,c,t).
mot(elegant,e,l,e,g,a,n,t).

puzzle(V1, V2, V3, H1, H2, H3):- mot(V1, _, V1H1, _, V1H2, _, V1H3, _),
                                 mot(V2, _, V2H1, _, V2H2, _, V2H3, _),
                                 mot(V3, _, V3H1, _, V3H2, _, V3H3, _),
                                 mot(H1, _, V1H1, _, V2H1, _, V3H1, _),
                                 mot(H2, _, V1H2, _, V2H2, _, V3H2, _),
                                 mot(H3, _, V1H3, _, V2H3, _, V3H3, _).

