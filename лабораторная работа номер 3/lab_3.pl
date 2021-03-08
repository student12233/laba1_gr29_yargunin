max(X,Y,X):-X>Y,!.
max(_,Y,Y):-!.
max(X,Y,Z,U):-max(X,Y,T),max(T,Z,U).

fact(N,X):-factorial(N,X,1).
factorial(1,X,X):-!.
factorial(N,X,X1):-N1 is N-1,X2 is X1*N,factorial(N1,X,X2).

fib(N,X):-fibo(N,1,1,0,X).
fibo(N,N,Xt,_,Xt):-!.
fibo(N,Nt,Xt,Xtp,X):-Nt1 is Nt+1,Xt1 is Xt + Xtp,fibo(N,Nt1,Xt1,Xt,X).

sum(X,S):-sum(X,S,0).
sum(0,St,St):-!.

sum(X,S,St):-St1 is (X mod 10)+St,X1 is X div 10,sum(X1,S,St1).
min(X,M):-M1 is X mod 10,X1 is X div 10,min(X1,M,M1).
min(X,M,Mt):- X1 is X div 10, X1 is 0,M is Mt,!.
min(X,M,Mt):-((Mt>X mod 10,M1 is X mod 10,!);(M1 is Mt,!)),X1 is X div 10,!,min(X1,M,M1).

m_3(X,M):-m_3(X,M,0).
m_3(0,M,Mn):-M is Mn,!.
m_3(X,M,Mn):-((3>X mod 10,M1 is Mn +1,!);(M1 is Mn,!)),X1 is X div 10,!,m_3(X1,M,M1).

del(X,Y):-0 is X mod Y.
nod(X,Y,H):-nod(X,Y,H,X).
nod(X,Y,H,I):-(del(X,I),del(Y,I),H is I,!);I1 is I-1,nod(X,Y,H,I1).
prost(1):-!.
prost(2):-!.
prost(X):-X1 is X div 2,prost(X,X1).
prost(_,1):-!.
prost(X,I):-not( del(X,I)),I1 is I-1,prost(X,I1).
kol_del(1,1):-!.
kol_del(X,I):-X1 is X div 2, kol_del(X,I,2,X1).
kol_del(_,I,I,1):-!.
kol_del(X,I,T,W):- (del(X,W),W1 is W-1,T1 is T+1,kol_del(X,I,T1,W1),!);(W1 is W-1,kol_del(X,I,T,W1),!).

posled(I):-posled(1,250000,X),posled(250000,500000,Y),posled(500000,750000,Z),max(X,Y,Z,I1),posled(750000,1000000,I2),max(I1,I2,I).



posled(X,T,I):-posled(X,T,I,0).
posled(X,X,I,It):-I = It,!.
posled(X,T,I,It):-d_13(X,Y,0),(It<Y->I1 = Y;I1 = It),X1 is X+1,posled(X1,T,I,I1).
d_13(1,K,Kt):-K is Kt +1,!.
d_13(X,K,Kt):-0 is X mod 2 ->(K1 is Kt+1,X1 is X/2,d_13(X1,K,K1),! );(K1 is Kt+1,X1 is X*3+1,d_13(X1,K,K1),!).

sum_del(1,1):-!.
sum_del(X,I):- sum_del(X,I,1,X).
sum_del(_,I,I,1):-!.
sum_del(X,I,T,W):- (del(X,W),prost(W),W1 is W-1,T1 is T+W,sum_del(X,I,T1,W1),!);(W1 is W-1,sum_del(X,I,T,W1),!).

d_16(X):-d_16(X,1,1,O),O is 1,!.
d_16(X,Y,Z,O):-X is Y+2*Z*Z,prost(Y),O = 1.
d_16(X,Y,Z,O):-(X>=Y,Y<X,Z<X,Y1 is Y+1,Z1 is Z+1,d_16(X,Y1,Z,O1),d_16(X,Y,Z1,O2),O2+O1>0,O=1);(O = 0).
spi(X):-spi(3,X).
spi(XT,X):-prost(XT),not(d_16(X)),X=XT,!.
spi(XT,X):-XT1 is XT+1,spi(XT1,X).
