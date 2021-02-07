
man(�����).
man(������).
man(������).
man(�����).
man(�����).
man(�������).
man(������).
man(�����).
man(�����).
man(����).
man(����).
man(������).
man(������).



woman(����).
woman(�����).
woman(�����).
woman(����).
woman(������).
woman(���).
woman(�����).
woman(�����).

parent(�����,����).
parent(�����,�����).
parent(�����,������).

parent(�����,����).
parent(�����,�����).
parent(�����,������).

parent(������,�����).
parent(������,�����).
parent(�����,�������).

parent(�����,�����).
parent(�����,�����).
parent(�����,�������).

parent(����,������).
parent(����,�����).
parent(������,������).
parent(������,�����).

parent(����,����).
parent(����,������).
parent(�����,����).
parent(�����,������).

parent(�������,������).
parent(������,������).

parent(������,�����).
parent(������,���).
parent(������,����).

parent(�����,�����).
parent(�����,���).
parent(�����,����).




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
