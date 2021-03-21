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
check_element(_,_):-write("элемент не нашелся").
check_numb(N1,X):-read_list(N1,L),list_el_numb(L,N,X),write(N),!.
check_numb(_,_):-write("номер не корректен").
min(X,Y,X):-X<Y,!.
min(_,Y,Y):-!.
max(X,Y,X):-X>Y,!.
max(_,Y,Y):-!.


min_list_up([H],H):-!.
min_list_up([H|T],Min):-min_list_up(T,Min1),min(H,Min1,Min).
min_list_down([H|T],Min):-min_d([H|T],H,Min).
min_d([],Min,Min):-!.
min_d([H|T],Tec,Min):-min(Tec,H,Tec1),min_d(T,Tec1,Min).

max_list_up([H],H):-!.
max_list_up([H|T],Min):-max_list_up(T,Min1),max(H,Min1,Min).


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
pos(N,[H|T],[]):-kolwo_elements([H|T],N),!.
pos(N,[H|T],[H1|T1]):-pos_n(N,[H|T],[H1|T1],1).
pos_n(N,[_|T],T,N):-!.
pos_n(N,[_|T],[H1|T1],Nt):-N1 is Nt+1,pos_n(N,T,[H1|T1],N1).
pred(1,_,[]):-!.
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

d12([X|T],[X1|T1]):-ind_min([X|T],I1),ind_max([X|T],I2),I1>I2,sred(I2,I1,[X|T],[X2|T2]),revers([X2|T2],R3),pred(I2,[X|T],R1),list_el_numb([X|T],R2,I2),screp(R1,[R2],R12),screp(R12,R3,R123),list_el_numb([X|T],R4,I1),screp(R123,[R4],R1234),pos(I1,[X|T],R5),screp(R1234,R5,[X1|T1]),!.
d12([X|T],[X1|T1]):-ind_min([X|T],I1),ind_max([X|T],I2),I1<I2,sred(I1,I2,[X|T],[X2|T2]),revers([X2|T2],R3),pred(I1,[X|T],R1),list_el_numb([X|T],R2,I1),screp(R1,[R2],R12),screp(R12,R3,R123),list_el_numb([X|T],R4,I2),screp(R123,[R4],R1234),pos(I2,[X|T],R5),screp(R1234,R5,[X1|T1]),!.




ind_min([X|T],I):-min_list_up([X|T],X1),list_el_numb([X|T], X1,I).
ind_max([X|T],I):-max_list_up([X|T],X1),list_el_numb([X|T], X1,I).
sred(I,I,[_|_],[]):-!.
sred(I,J,[X|T],[X1|T1]):-pred(I,[X|T],R2),pred(J,[X|T],R3),list_el_numb([X|T],X2,I),screp(R2,[X2],R4),screp(R4,[X1|T1],R3).

d22([H|T],I,J, K):-sred(I,J,[H|T],R),list_el_numb([X|T],R1,I),list_el_numb([X|T],R2,J),screp([R1],R,R12),screp(R12,[R2],R123),min_list_up(R123,X),kolwo_el(R123,X,K).
d24([H|T],M1,M2):-max_list_up([H|T],M1),ind_max([H|T],I),deletes([H|T],I,T2),max_list_up(T2,M2).
chered([_]).
chered([H|T]):-H>=0->che(T,'-');che(T,'+').
che([],_):-!.
che([H|T],'+'):-H>0,che(T,'-').
che([H|T],'-'):-H<0,che(T,'+').
mach_nechet([],_):-false.
mach_nechet([H|T],M):-max_list_up([H|T],M),1 is M mod 2.
mach_nechet([H|T],M):-ind_max([H|T],I),deletes([H|T],I,T2),mach_nechet(T2,M).
sred_ar([H|T],M):-kolwo_elements([H|T],K),sum_list_up([H|T], Summ),M is Summ / K.

min_list_x_down([H|T],X,K):-min_dx([H|T],0,X,K).
min_dx([],K,_,K):-!.
min_dx([H|T],Kt,X,K):-H<X->(Kt1 is Kt+1,min_dx(T,Kt1,X,K));min_dx(T,Kt,X,K).

d_42([H|T],Kt):-sred_ar([H|T],M),min_list_x_down([H|T],M,Kt).

max_kolwo([H|T],X):-kolwo_el([H|T],H,K),max_kol([H|T],H,X,K).
max_kol([],K,K,_).
max_kol([H|T],Xt,X,Kt):-kolwo_el([H|T],H,K),K>Kt->max_kol(T,H,X,K) ;max_kol(T,Xt,X,Kt).
max_list_kol([H|T],R):-max_kolwo([H|T],X),mlk([H|T],X,1,[],R).
mlk([],_,_,T,T):-!.
mlk([H|T],X,I,Tt,R):-H is X->(screp(Tt,[I],Tt1),I1 is I+1,mlk(T,X,I1,Tt1,R));(I1 is I+1,mlk(T,X,I1,Tt,R)).

delete_all_no_unic([H|T],R,B):-dan([H|T],[H|T],R,1,[],B,[]).
dan(_,[],R,_,R,BV,BV):-!.
dan([H1|T1],[H|T],R,I,RT,B,BV):-kolwo_el([H1|T1],H,K),K is 1->(screp(RT,[H],RB),screp(BV,[I],BB),I1 is I+1,dan([H1|T1],T,R,I1,RB,B,BB));(I1 is I+1,dan([H1|T1],T,R,I1,RT,B,BV)).
delitsi([H|T],K):-delete_all_no_unic([H|T],R,B),delss(R,B,K,0).
delss([],[],K,K):-!.
delss([H1|T1],[H2|T2],K,KT):-0 is H1 mod H2->(K1 is KT+1,delss(T1,T2,K,K1));delss(T1,T2,K,KT).






