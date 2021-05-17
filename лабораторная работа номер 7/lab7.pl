write_list([]):-!.
write_list([H|T]):- write(H), nl, write_list(T).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

p1:- read_str(List,Length), write_str(List), write(", "), write_str(List),
	write(", "), write_str(List), nl, write("Length = "), write(Length).

pr5_2:-read_str(A,_),count_words(A,K),write(K).

count_words(A,K):-count_words(A,0,K).

count_words([],K,K):-!.
count_words(A,I,K):-skip_space(A,A1),get_word(A1,Word,A2),Word \=[],I1 is I+1,count_words(A2,I1,K),!.
count_words(_,K,K).

skip_space([32|T],A1):-skip_space(T,A1),!.
skip_space(A1,A1).

get_word([],[],[]):-!.
get_word(A,Word,A2):-get_word(A,[],Word,A2).

get_word([],Word,Word,[]).
get_word([32|T],Word,Word,T):-!.
get_word([H|T],W,Word,A2):-append(W,[H],W1),
							get_word(T,W1,Word,A2).



get_words(A,Words,K):-get_words(A,[],Words,0,K).

get_words([],B,B,K,K):-!.
get_words(A,Temp_words,B,I,K):-
	skip_space(A,A1),get_word(A1,Word,A2),Word \=[],
	I1 is I+1,append(Temp_words,[Word],T_w),get_words(A2,T_w,B,I1,K),!.
get_words(_,B,B,K,K).



pr3:-read_str(A,_),get_words(A,Words,_),unique_elems(Words,U_words),
		counts(U_words,C,Words),indOfMax(C,Ind),el_by_number(U_words,Ind,El),
		write_str(El).
counts([],[],_):-!.
counts([Word|T_words],[Count|T_counts],Words):-
	count(Word,Words,Count),counts(T_words,T_counts,Words).
unique_elems([], []):- !.
unique_elems([H|T], List2):- unique_elems([H|T], List2, []).
unique_elems([], CurList, CurList):- !.
unique_elems([H|T], List, []):- unique_elems(T, List, [H]), !.
unique_elems([H|T], List, CurList):-
	not(contains(CurList, H)), append(CurList, [H], NewList), unique_elems(T, List, NewList), !.
unique_elems([_|T], List, CurList):- unique_elems(T, List, CurList).

contains([], _):- !, fail.
contains([H|_], H):- !.
contains([_|T], N):- contains(T, N).

count(_, [], 0):-!.
count(Elem, List, X):- count(Elem, List, 0, X).
count(_, [], Count, Count):- !.
count(Elem, [Elem|T], Count, X):- Count1 is Count + 1, count(Elem, T, Count1, X), !.
count(Elem, [_|T], Count, X):- count(Elem, T, Count, X).

indOfMax(X,Y):-indexOfMin(X,Y).
indexOfMin([], -1):- !.
indexOfMin([H|T], X):-indexOfMin(T, 1, 1, X, H).
indexOfMin([], _, MinInd, MinInd, _):-!.
indexOfMin([H|T], CurInd, _, X, CurMin):-
	H > CurMin, NewCurInd is CurInd + 1, indexOfMin(T, NewCurInd, NewCurInd, X, H), !.
indexOfMin([_|T], CurInd, MinInd, X, CurMin):-
	NewCurInd is CurInd + 1, indexOfMin(T, NewCurInd, MinInd, X, CurMin).
el_by_number(A,Ind,El):-el_by_number(A,1,Ind,El).
el_by_number([],_,_,nil):-!.
el_by_number([El|_],Ind,Ind,El):-!.
el_by_number([_|T],I,Ind,El):-I1 is I+1,el_by_number(T,I1,Ind,El).


pr4:- read_str([H|T],L), (L>5 -> pr_l([H|T],0,L); pr_r(H,L)).

pr_l([],_,_):-!.
pr_l([H|T],I,L):- I<3, write_str([H]), I1 is I+1, pr_l(T,I1,L),!.
pr_l([H|T],I,L):- M is L-I, M<4, write_str([H]), I1 is I+1, pr_l(T,I1,L),!.
pr_l([_|T],I,L):- I1 is I+1, pr_l(T,I1,L).

pr_r(_,0):-!.
pr_r(H,L):- write_str([H]), L1 is L-1, pr_r(H,L1).

pr5:- read_str(List,L), reverse_list(List,[H|T]), pr5([H|T],List1,H,0,L),
	write_list(List1).

reverse_list([],List):- reverse_list([],[],List),!.
reverse_list([Head|Tail],List):- reverse_list([Head|Tail],[],List).
reverse_list([],List1,List1):-!.
reverse_list([Head|Tail],List_r, List):- reverse_list(Tail,[Head|List_r],List).

pr5([],[],_,_,_):-!.
pr5([H1|T1],[H2|T2],H1,I,L):- H2 is L-I-1, I1 is I+1, pr5(T1,T2,H1,I1,L),!.
pr5([_|T1],List,H,I,L):- I1 is I+1, pr5(T1,List,H,I1,L).

pr6:-read_str(St,_),pr6(St,0).
pr6([],_):-!.
pr6([H|T],Count):-Count1 is Count+1,(0 is Count1 mod 3 -> put(H),pr6(T,Count1);pr6(T,Count1)).

pr7:- read_str(List,_), pr7(List,0,0,Z,Zer), write("Znack = "), write(Z), write(","), nl,
	write("Zero = "), write(Zer), write(".").

pr7([],I,C,I,C):-!.
pr7([H1,H2|T],I,C,I0,C0):- (H1 = 43; H1 = 45), I1 is I+1,
	(H2 = 48 -> C1 is C+1, pr7(T,I1,C1,I0,C0); pr7([H2|T],I1,C,I0,C0)),!.
pr7([H|T],I,C,I0,C0):- (H = 43; H = 45), I1 is I+1, pr7(T,I1,C,I0,C0),!.
pr7([_|T],I,C,I0,C0):- pr7(T,I,C,I0,C0).

pr8:-read_str(A,_),prov_w(A,0,Indw),prov_x(A,0,Indx),(Indw<Indx->write("w встречается раньше");write("x стречается первее")).
prov_w([],_,_):-write("не встречается w"),fail,!.
prov_w([Head|Tail],I,Ind):-(Head =:=119 -> Ind is I;I1 is I+1,prov_w(Tail,I1,Ind)).

prov_x([],_,_):-write("не встречается x"),!,fail.
prov_x([Head|Tail],I,Ind):-(Head =:=120 -> Ind is I;I1 is I+1,prov_x(Tail,I1,Ind)).
length_list([],K,K):-!.
length_list([_|T],K,Kol):-K1 is K+1,length_list(T,K1,Kol).

pr9:-read_str(St1,N1),read_str(St2,N2),(N1>N2 -> N3 is N1-N2,write_raz(N3,St1);N3 is N2-N1,
		write_raz(N3,St2)).
write_raz(0,_):-!.
write_raz(N,St):-write_str(St),N1 is N-1,write_raz(N1,St).

pr10:- read_str(List,_),
	(pr10(List,L1) -> write_str(L1);
	append_list(List,[122,122,122],L2), write_str(L2)).

pr10([97,98,99|T],[119,119,119|T]):-!.
append_list([],List2,List2).
append_list([H|T1],List2,[H|T2]):- append_list(T1,List2,T2).

pr11:- read_str(List,L), (L>10 -> pr_b(List,List1), write_str(List1);
	pr_m(List,List2,L), write_str(List2)).

pr_b([H1,H2,H3,H4,H5,H6|_],[H1,H2,H3,H4,H5,H6]):-!.
pr_m(List,List,12):-!.
pr_m(List,List_1,L):- L1 is L+1, append_list(List,[111],List1), pr_m(List1,List_1,L1).

pr13:- read_str(List,_), pr13(List,List1,0), write_str(List1).

pr13([],[],_):-!.
pr13([97|T1],[99|T2],I):- 0 is I mod 2, I1 is I+1, pr13(T1,T2,I1),!.
pr13([98|T1],[99|T2],I):- 0 is I mod 2, I1 is I+1, pr13(T1,T2,I1),!.
pr13([_|T1],[97|T2],I):- 0 is I mod 2, I1 is I+1, pr13(T1,T2,I1),!.
pr13([H|T1],[H|T2],I):- I1 is I+1, pr13(T1,T2,I1).

pr14:-read_str(St,_),pr14(St,0,Kol),write(Kol).
pr14([],K,K):-!.
pr14([H|T],K,Kol):-H>47,H<58,K1 is K+1,pr14(T,K1,Kol),!.
pr14([_|T],K,Kol):-pr14(T,K,Kol),!.


pr15:-read_str(Str,_),pr15(Str).
pr15([]):-!.
pr15([H|_]):-H\=97,H\=98,H\=99,!,fail.
pr15([_|T]):-pr15(T).

pr16:- read_str(List,_), pr16(List,L), write_str(L).

pr16([],[]):-!.
pr16([119,111,114,100|T1],[108,101,116,116,101,114|T2]):- pr16(T1,T2),!.
pr16([H|T1],[H|T2]):- pr16(T1,T2).

pr17:-read_str(St,_),delete_abc(St,[],NL),write_str(NL).
delete_abc([],NL,NL):-!.
delete_abc([120,97,98,99|T],Buffer,NL):-append_list(Buffer,[97,98,99],BufferN),delete_abc(T,BufferN,NL),!.
delete_abc([H|T],Buffer,NL):-append_list(Buffer,[H],BufferN),delete_abc(T,BufferN,NL).
pr18:- read_str(List,_), pr18(List,L), write_str(L).
pr18([],[]):-!.
pr18([97,98,99,H|T1],[H|T2]):- H>=48, H=<57, pr18(T1,T2),!.
pr18([H|T1],[H|T2]):- pr18(T1,T2).
pr19:- read_str(List,_), pr19(List,0,C), write("количество = "), write(C).

pr19([],I,I):-!.
pr19([97,98,97|T],I,C):- I1 is I+1, pr19(T,I1,C),!.
pr19([_|T],I,C):- pr19(T,I,C).

pr20:- read_str(List,_), delete_space(List,L1), pr20(L1,L), write_str(L).

pr20([],[]):-!.
pr20([32,32|T],List):- pr20([32|T],List),!.
pr20([32,H|T1],[32,H|T2]):- pr20(T1,T2),!.
pr20([32],List):- pr20([],List),!.
pr20([H|T1],[H|T2]):- pr20(T1,T2).
delete_space([32|T],List):- delete_space(T,List),!.
delete_space(List,List).

pr21_1:- write("введите строку."), nl, read_str(List1,_),
	write("введите разделители."), nl, read_str(List2,_),
	pr21_1(List1,List2,List), delete_space(List,L1), pr20(L1,L), write_str(L).

pr21_1([],_,[]):-!.
pr21_1([H|T1],List2,[32|T2]):- in_list(List2,H), pr21_1(T1,List2,T2),!.
pr21_1([H|T1],List2,[H|T2]):- pr21_1(T1,List2,T2).
in_list([El|_],El):-!.
in_list([_|T],El):-in_list(T,El).

pr21_2:- read_str(List,L), pr21_2(List,1,L).

pr21_2([],_,_):-!.
pr21_2([H|T],1,L):- write_str([H]), nl, pr21_2(T,2,L),!.
pr21_2([H|T],I,L):- L is (I-1)*2+1, write_str([H]), nl, I1 is I+1, pr21_2(T,I1,L),!.
pr21_2([H],_,_):- write_str([H]),!.
pr21_2([_|T],I,L):- I1 is I+1, pr21_2(T,I1,L).
