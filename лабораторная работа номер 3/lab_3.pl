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

m_3(X,M):- X1 is X div 10, X1 is 0,M1 is X mod 10,((M1<3,M is 1);M is 0),!.
m_3(X,M):-X1 is X div 10,m_3(X1,M1),((3 < X mod 10,M is M1,!);(M is M1+1,!)).


