max(X,Y,X):-X>Y,!.
max(_,Y,Y):-!.
max(X,Y,Z,U):-max(X,Y,T),max(T,Z,U).
fact(N,X):-factorial(N,X,1).
factorial(1,X,X):-!.
factorial(N,X,X1):-N1 is N-1,X2 is X1*N,factorial(N1,X,X2).
fib(N,X):-fibo(N,1,1,0,X).
fibo(N,N,Xt,_,Xt):-!.
fibo(N,Nt,Xt,Xtp,X):-Nt1 is Nt+1,Xt1 is Xt + Xtp,fibo(N,Nt1,Xt1,Xt,X).
sum(X,S):- X1 is X div 10 ,X1 is 0,S=X.
sum(X,S):-X1 is X div 10,sum(X1,S1),S is S1+X mod 10.



