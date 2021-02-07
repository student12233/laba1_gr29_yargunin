
man(артем).
man(виктор).
man(михаил).
man(павел).
man(рикки).
man(алексей).
man(акакий).
man(гарри).
man(павел).
man(ваня).
man(вова).
man(роджер).
man(никита).



woman(нина).
woman(алина).
woman(мария).
woman(рита).
woman(полина).
woman(оля).
woman(жанна).
woman(настя).

parent(артем,рита).
parent(артем,павел).
parent(артем,акакий).

parent(мария,рита).
parent(мария,павел).
parent(мария,акакий).

parent(михаил,гарри).
parent(михаил,настя).
parent(ихаил,алексей).

parent(алина,гарри).
parent(алина,настя).
parent(алина,алексей).

parent(нина,полина).
parent(нина,рикки).
parent(виктор,полина).
parent(виктор,рикки).

parent(рита,ваня).
parent(рита,никита).
parent(гарри,ваня).
parent(гарри,никита).

parent(алексей,роджер).
parent(полина,роджер).

parent(акакий,жанна).
parent(акакий,оля).
parent(акакий,вова).

parent(настя,жанна).
parent(настя,оля).
parent(настя,вова).




mans:-man(X),write(X),nl,fail.
womans:-woman(X),write(X),nl,fail.
children(X):-parent(X,Y),write(Y),nl,fail.
mother(X,Y):-parent(X,Y),woman(X).
mother(X):-parent(Y,X),woman(Y),write(Y).
douther(X,Y):-parent(Y,X),woman(X).
douther(X):-mother(X,Y),woman(Y),write(Y),nl,fail.
brother(X,Y):-man(X),parent(Z,X),parent(Z,Y),dif(X,Y).
brother(X):-parent(Y,X),parent(Y,Z),man(Z),dif(X,Z),write(Z),nl,fail.
husband(X,Y):-parent(X,Z),parent(Y,Z),man(X).
husband(X):-parent(X,Y),parent(Z,Y),man(Z),write(Z).
b_s(X,Y):-parent(Z,X),parent(Z,Y).
b_s(X):-parent(Z,X),woman(Z),parent(Z,Y),dif(X,Y),write(Y),nl,fail.
grand_pa(X,Y):-parent(Z,Y),parent(X,Z),man(X).
grand_pas(X):-parent(Z,X),parent(Y,Z),man(Y),write(Y),nl,fail.
grand_da(X, Y):-woman(X),parent(Z,X),parent(Y,Z).
grand_dats(X):-parent(X,Y),parent(Y,Z),woman(Z),write(Z),nl,fail.
grand_pa_and_son(X,Y):-grand_pa(X,Y),man(Y);grand_pa(Y,X),man(X).
grand_pa_and_da(X,Y):-grand_da(X,Y),woman(Y);grand_da(Y,X),woman(X).
dada(X,Y):-brother(X,Z),parent(Z,Y).
dada(X):-parent(Y,X),brother(Z,Y),write(Z),nl,fail.
