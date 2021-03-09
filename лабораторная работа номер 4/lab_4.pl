plus_c(A,B,[H|T]):-H = A,T = B,!.
screp([],A,A):-!.
screp([H|T],A,[H|T2]):-screp(T,A,T2).
read_list(0,[]):-!.
read_list(N,X):-read(X1),N1 is N-1,read_list(N1,X2),screp([X1],X2,X).
write_list([X]):-write(X).
write_list([X|Y]):-write(X),write_list(Y).
read_and_write(N):-read_list(N,X),write_list(X).
sum_list_down(List, Summ):-sum(List,0,Summ).
sum([],S,S):-!.
sum([H|Ti],T,S):-T1 is T+H,sum(Ti,T1,S).
suum_list_down(N):-read_list(N,X),sum_list_down(X,S),write(S).
sum_list_up([H|T], Summ):-sum_list_up(T, Summ1),Summ is Summ1+H.
sum_list_up([], 0):-!.

list_el_numb([], _, _):-!.
list_el_numb([H|_],H,1):-!.
list_el_numb(List, Elem, Number):-list_el(List,Elem,Number,1).
list_el([],_,_,_):-fail,!.
list_el([H|_],Elem,Tec_num,Tec_num):-Elem is H,!.
list_el([_|T],Elem,Num,Tec):-Tec1 is Tec+1,list_el(T,Elem,Num,Tec1).
