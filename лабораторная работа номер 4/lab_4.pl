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

list_el_numb([], _, _):-fail,!.
list_el_numb([H|_],H,1):-!.
list_el_numb(List, Elem, Number):-list_el(List,Elem,Number,1).
list_el([],_,_,_):-fail,!.
list_el([H|_],H,Tec_num,Tec_num):-!.
list_el([_|T],Elem,Num,Tec):-Tec1 is Tec+1,list_el(T,Elem,Num,Tec1).

check_element(N1,X):-read_list(N1,L),list_el_numb(L,X,N),write(N),!.
check_element(_,_):-write("������� �� �������").
check_numb(N1,X):-read_list(N1,L),list_el_numb(L,N,X),write(N),!.
check_numb(_,_):-write("����� �� ���������").
min(X,Y,X):-X<Y,!.
min(_,Y,Y):-!.

min_list_up([H],H):-!.
min_list_up([H|T],Min):-min_list_up(T,Min1),min(H,Min1,Min).
min_list_down([H|T],Min):-min_d([H|T],H,Min).
min_d([],Min,Min):-!.
min_d([H|T],Tec,Min):-min(Tec,H,Tec1),min_d(T,Tec1,Min).

vivod_min(N):-read_list(N,L),min_list_down(L,X),write(X).
in_lest([X|_],X):-!.
in_lest([_|T],X):-in_lest(T,X).

end_el([H],H):-!.
end_el([_|T],X):-end_el(T,X).
revers([],[]):-!.
revers([H],[H]):-!.
revers([H|T],[H1|T1]):- end_el([H|T],H1),screp(T2,[H1],[H|T]),revers(T2,T1).

ravenstvo([H],[H|_]):-!.
ravenstvo([H|_],[H]):-!.
ravenstvo([H|T],[H1|T1]):- H is H1 ,ravenstvo(T,T1).
sravn([H|T],[H1|T1]):-ravenstvo([H|T],[H1|T1]).
sravn([H|T],[_|T1]):-sravn([H|T],T1).

pos(N,[H|T],[H1|T1]):-pos_n(N,[H|T],[H1|T1],1).
pos_n(N,[_|T],T,N):-!.
pos_n(N,[_|T],[H1|T1],Nt):-N1 is Nt+1,pos_n(N,T,[H1|T1],N1).
pred(N,[H|T],[H1|T1]):-pred_n(N,[H|T],[H1|T1],1).
pred_n(N,[_|_],[],N):-!.
pred_n(N,[H|T],[H1|T1],Nt):-N1 is Nt+1,H1 = H,pred_n(N,T,T1,N1).

deletes([H|T],I,T2):-pos(I,[H|T],T3),pred(I,[H|T],T4),screp(T4,T3,T2).

search([H|T],X,I):-sear([H|T],X,I,1).
sear([X|_],X,I,I):-!.
sear([_|T],X,I,Tc):-Tc1 is Tc+1,sear(T,X,I,Tc1).
ydal(Li,X,Li):-not(search(Li,X,_)),!.
ydal(L,X,Li):-search(L,X,I),delete(L,I,L1),ydal(L1,X,Li).

kolwo([H|T],X,K):-kol([H|T],X,K,0).
kol([],_,K,K):-!.
kol([H|T],X,K,Tec):-(H is X -> T1 is  Tec+1;T1 is Tec),kol(T,X,K,T1).
ynic([X],[X]):-!.
ynic([H|T],[H|T1]):-kolwo([H|T],H,K),K is 1 ->ynic(T,T1),!.
ynic([_|T],[H1|T1]):-ynic(T,[H1|T1]).


kolwo_el([H|T],X,K):-kolwo([H|T],X,K).
kolwo_elements([H|T],K):-k1([H|T],K,1).
k1([_],K,K):-!.
k1([_|T],K,Tt):-T1 is Tt+1,k1(T,K,T1).

d11([X|T],X):- kolwo_el([X|T],X,1),!.
d11([H|T],X):-neon([H|T],X,H).
neon([H|_],H,N):-not(H is N),!.
neon([_|T],X,N):-neon(T,X,N).
