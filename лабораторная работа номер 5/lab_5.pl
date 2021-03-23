screp([],A,A):-!.
screp([H|T],A,[H|T2]):-screp(T,A,T2).
in_lest([X|_],X).
in_lest([_|T],X):-in_lest(T,X).
new_lest(1,[]):-!.
new_lest(N,[H|T]):- N1 is N -1,new_lest(N1,T).
house([red,green,yellow,blue,white]).
people([england,espan,ycrainec,norveg,japanish]).
animal([dog,ylitca,fox,horse,zebra]).
drink([coffe,tea,milk,sok,woter]).
smoke([oldgold,kool,chestefield,luckystrike,parliament]).
zap(A,[H|T]):-in_lest(A,H),zap(A,T).
zapoln(X1):-new_lest(5,X1),animal(Y),zap(X1,Y).

