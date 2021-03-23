sub_posl([],_):-!.
sub_posl(_,[]):-fail,!.
sub_posl([H|Sub_list],[H|List]):-sub_posl(Sub_list,List),!.
sub_posl([],_):-!.
sub_posl(_,[]):-fail,!.
sub_posl([H|Sub_list],[H|List]):-sub_posl(Sub_list,List),!.
sub_posl(Sub_list,[_|List]):-sub_posl(Sub_list,List).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[_|Set]):-sub_set(Sub_set,Set).
% задание номер 1
in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).


sprava_next(_,_,[_]):-fail.
sprava_next(A,B,[A|[B|_]]).
sprava_next(A,B,[_|List]):-sprava_next(A,B,List).

sleva_next(_,_,[_]):-fail.
sleva_next(A,B,[B|[A|_]]).
sleva_next(A,B,[_|List]):-sleva_next(A,B,List).

next_to(A,B,List):-sprava_next(A,B,List).
next_to(A,B,List):-sleva_next(A,B,List).

el_no(List,Num,El):-el_no(List,Num,1,El).
el_no([H|_],Num,Num,H):-!.
el_no([_|Tail],Num,Ind,El):-Ind1 is Ind+1,el_no(Tail,Num,Ind1,El).

pr_ein:- Houses=[_,_,_,_,_],

		in_list(Houses,[red,english,_,_,_]),
		in_list(Houses,[_,spanish,_,dog,_]),
		in_list(Houses,[green,_,coffee,_,_]),
		in_list(Houses,[_,ukrain,tea,_,_]),
		sprava_next([green,_,_,_,_],[white,_,_,_,_],Houses),
		in_list(Houses,[_,_,_,ulitka,old_gold]),
		in_list(Houses,[yellow,_,_,_,kool]),
		el_no(Houses,3,[_,_,milk,_,_]),
		el_no(Houses,1,[_,norway,_,_,_]),
		next_to([_,_,_,_,chester],[_,_,_,fox,_],Houses),
		next_to([_,_,_,_,kool],[_,_,_,horse,_],Houses),
		in_list(Houses,[_,_,orange,_,lucky]),
		in_list(Houses,[_,japan,_,_,parlament]),
		next_to([_,norway,_,_,_],[blue,_,_,_,_],Houses),


		in_list(Houses,[_,WHO1,water,_,_]),
		in_list(Houses,[_,WHO2,_,zebra,_]),
		write(Houses),
		write(WHO1),nl,write(WHO2).
% задание номер 2.
people2(рыжов).
people2(чернов).
people2(белов).
pen2(брюнет).
pen2(блондин).
pen2(рыжий).

list_el_numb([], _, _):-fail,!.
list_el_numb([H|_],H,1):-!.
list_el_numb(List, Elem, Number):-list_el(List,Elem,Number,1).
list_el([],_,_,_):-fail,!.
list_el([H|_],H,Tec_num,Tec_num):-!.
list_el([_|T],Elem,Num,Tec):-Tec1 is Tec+1,list_el(T,Elem,Num,Tec1).


screp([],A,A):-!.
screp([H|T],A,[H|T2]):-screp(T,A,T2).



all_lest2_people(R):-ales2_people(R,[]),!.
ales2_people(R,RT):-people2(X),not(in_list(RT,X)),screp(RT,[X],RS),ales2_people(R,RS).
ales2_people(R,R).
all_lest2_pen(R):-ales2_pen(R,[]),!.
ales2_pen(R,RT):-pen2(X),not(in_list(RT,X)),screp(RT,[X],RS),ales2_pen(R,RS).
ales2_pen(R,R).

pr_2:-all_lest2_people(R1),all_lest2_pen(R2),
    (list_el_numb(R1,рыжов,X1),list_el_numb(R2,рыжий,Y1)),dif(X1,Y1),
     (list_el_numb(R1,белов,X2),list_el_numb(R2,блондин,Y2)),dif(X2,Y2),
      (list_el_numb(R1,чернов,X3),list_el_numb(R2,брюнет,Y3)),dif(X3,Y3),
      write(R1),nl,write(R2),nl.

% задание номер 3.

pr_3:-Naborr=[_,_,_],
    in_list(Naborr,[_,_,белый]),
    in_list(Naborr,[_,_,зеленый]),
    in_list(Naborr,[_,_,синий]),
    in_list(Naborr,[_,белый,_]),
    in_list(Naborr,[_,зеленый,_]),
    in_list(Naborr,[_,синий,_]),
    in_list(Naborr,[аня,X1,X1]),
     in_list(Naborr,[валя,X2,Y2]),dif(X2,Y2),not(X2 = белый),not(Y2 = белый),
      in_list(Naborr,[наташа,_,зеленый]),
      write(Naborr).
% задание номер 4.

pr_4:-Nab4=[_,_,_],
    in_list(Nab4,[слесарь,_]),
     in_list(Nab4,[сварщик,_]),
      in_list(Nab4,[токарь,_]),
      in_list(Nab4,[_,борисов]),
     in_list(Nab4,[_,семенов]),
      in_list(Nab4,[_,иванов]),

	el_no(Nab4,1,[слесарь,X]),not(X = борисов),
         sprava_next([_,семенов],[токарь,_],Nab4),
         write(Nab4).






