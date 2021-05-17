in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

read_str(A,N):- get0(X), r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):- K1 is K+1, append(B,[X],B1), get0(X1), r_str(X1,A,B1,N,K1).

write_list([]):-!.
write_list([Head|Tail]):- write(Head), write_list(Tail).

write_str([]):-!.
write_str([H|Tail]):- put(H), write_str(Tail).

pr1_1:- tell('C:\\d\\репозиторий\\laba1_gr29_yargunin\\лабораторная работа номер 9\\Новый текстовый документ.txt'),not( build_all_razm_p),told.
build_all_razm_p:- read_str(A,_), read(K), b_a_rp(A,K,[]).

b_a_rp(_,0,Perm1):- write_str(Perm1), nl, !, fail.
b_a_rp(A,N,Perm):- in_list(A,El), N1 is N-1, b_a_rp(A,N1,[El|Perm]).

pr1_2:- tell('C:\\d\\репозиторий\\laba1_gr29_yargunin\\лабораторная работа номер 9\\Новый текстовый документ.txt'),not(b_a_p),told.
b_a_p:- read_str(A,_), b_a_p(A,[]).

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):- in_list_exlude(T,El,Tail).

b_a_p([],Perm1):- write_str(Perm1), nl, !, fail.
b_a_p(A,Perm):- in_list_exlude(A,El,A1), b_a_p(A1,[El|Perm]).

pr1_3:- tell('C:\\d\\репозиторий\\laba1_gr29_yargunin\\лабораторная работа номер 9\\Новый текстовый документ.txt'),not(b_a_raz), told.
b_a_raz:- read_str(A,_), read(K), b_a_raz(A,K,[]).

b_a_raz(_,0,Perm1):- write_str(Perm1), nl, !, fail.
b_a_raz(A,N,Perm):- in_list_exlude(A,El,A1), N1 is N-1, b_a_raz(A1,N1,[El|Perm]).

pr1_4:- tell('C:\\d\\репозиторий\\laba1_gr29_yargunin\\лабораторная работа номер 9\\Новый текстовый документ.txt'),not( pr_subset), told.
pr_subset:- read_str(A,_), sub_set(B,A), write_str(B), nl, fail.

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):- sub_set(Sub_set,Set).
sub_set(Sub_set,[_|Set]):- sub_set(Sub_set,Set).

pr1_5:- tell('C:\\d\\репозиторий\\laba1_gr29_yargunin\\лабораторная работа номер 9\\Новый текстовый документ.txt'),not(sochet), told.
sochet:- read_str(A,_), read(K), sochet(B,K,A), write_str(B), nl, fail.
sochet([],0,_):-!.
sochet([H|Sub_set],K,[H|Set]):- K1 is K-1, sochet(Sub_set,K1,Set).
sochet(Sub_set,K,[_|Set]):- sochet(Sub_set,K,Set).

pr1_6:- tell('C:\\d\\репозиторий\\laba1_gr29_yargunin\\лабораторная работа номер 9\\Новый текстовый документ.txt'),not( sochet_pov), told.
sochet_pov:- read_str(A,_), read(K), sochet_pov(B,K,A), write_str(B), nl, fail.
sochet_pov([],0,_):-!.
sochet_pov([H|Sub_set],K,[H|Set]):- K1 is K-1, sochet_pov(Sub_set,K1,[H|Set]).
sochet_pov(Sub_set,K,[_|Set]):- sochet_pov(Sub_set,K,Set).


put_letter(_,[],_,_):-!.
put_letter([H|T1],[I|T2],I,H):- I1 is I+1, put_letter(T1,T2,I1,H),!.
put_letter([_|T],Letter_positions,I,L):- I1 is I+1, put_letter(T,Letter_positions,I1,L).

put_free([H|_],L):- var(H), H = L,!.
put_free([_|T],L):- put_free(T,L),!.

pr2:- tell('C:\\d\\репозиторий\\laba1_gr29_yargunin\\лабораторная работа номер 9\\Новый текстовый документ.txt'),not(pre2), told.
pre2:- Pos = [0,1,2,3,4], Rez = [_,_,_,_,_],
	sochet(A_pos,2,Pos), put_letter(Rez,A_pos,0,a),
	in_list([b,c,d,e,f],El1), put_free(Rez,El1),
	in_list([b,c,d,e,f],El2), put_free(Rez,El2),
	in_list([b,c,d,e,f],El3), put_free(Rez,El3),
	write_list(Rez), nl, fail.

pr3:- tell('C:\\d\\репозиторий\\laba1_gr29_yargunin\\лабораторная работа номер 9\\Новый текстовый документ.txt'),not(pre3), told.
pre3:- Pos= [0,1,2,3,4], Rez = [_,_,_,_,_],
	sochet(A_pos,2,Pos), put_letter(Rez,A_pos,0,a),
	in_list_exlude([b,c,d,e,f],El1,A1), put_free(Rez,El1),
	in_list_exlude(A1,El2,A2), put_free(Rez,El2),
	in_list(A2,El3), put_free(Rez,El3),
	write_list(Rez), nl, fail.
