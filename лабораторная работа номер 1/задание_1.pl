
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
mother(X, Y):-parent(X,Y),woman(X).
mother(X):-parent(Y,X),woman(Y),write(Y).
douther(X,Y):-parent(Y,X),woman(X).
douther(X):-mother(X,Y),woman(Y),write(Y),nl,fail.
brother(X,Y):-man(X),parent(Z,X),parent(Z,Y).
brother(X):-parent(Y,X),parent(Y,Z),man(Z),dif(X,Z),write(Z),nl,fail.
