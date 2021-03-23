genre(x������_�������_������,0).
genre(��������_�����,0).
genre(����_���������,0).
genre(���_�����,0).
genre(�����_������,0).

genre(���������,1).
genre(�������,1).
genre(�������_��_��������_��_�����������x,1).
genre(�����������_�������,1).
genre(����_������,1).

genre(��������_��_�����_����,2).
genre(�����������_�������_������,2).
genre(��������,2).
genre(�������������_��������,2).
genre(�����������,2).

genre(���,3).
genre(�������_�����,3).
genre(�������_������_������������_�_�_���������,3).
genre(�������_����_��_�����,3).
genre(����������_�������,3).

country(�������_�������_������,0).
country(��������_�����,1).
country(����_���������,0).
country(���_�����,0).
country(�����_������,1).

country(���������,0).
country(�������_��_��������_��_�����������x,0).
country(�����������_�������,1).
country(����_������,0).
country(�������,0).

country(��������_��_�����_����,0).
country(�����������_�������_������,1).
country(��������,2).
country(�������������_��������,0).
country(�����������,0).

country(���,0).
country(�������_�����,1).
country(�������_������_������������_�_�_���������,0).
country(�������_����_��_�����,0).
country(����������_�������,0).

seria(�������_�������_������,1).
seria(��������_�����,1).
seria(����_���������,1).
seria(���_�����,1).
seria(�����_������,1).

seria(���������,0).
seria(�������_��_��������_��_�����������x,0).
seria(�����������_�������,0).
seria(����_������,1).
seria(�������,0).

seria(��������_��_�����_����,0).
seria(�����������_�������_������,1).
seria(��������,0).
seria(�������������_��������,0).
seria(�����������,0).

seria(���,0).
seria(�������_�����,0).
seria(�������_������_������������_�_�_���������,1).
seria(�������_����_��_�����,0).
seria(����������_�������,0).

data(x������_�������_������,1).
data(��������_�����,1).
data(����_���������,1).
data(���_�����,0).
data(�����_������,0).

data(���������,1).
data(�������,1).
data(�������_��_��������_��_�����������x,2).
data(�����������_�������,2).
data(����_������,1).

data(��������_��_�����_����,3).
data(�����������_�������_������,3).
data(��������,0).
data(�������������_��������,2).
data(�����������,0).

data(���,1).
data(�������_�����,3).
data(�������_������_������������_�_�_���������,3).
data(�������_����_��_�����,3).
data(����������_�������,2).

cinema(x������_�������_������,0).
cinema(��������_�����,1).
cinema(����_���������,1).
cinema(���_�����,0).
cinema(�����_������,0).

cinema(���������,1).
cinema(�������,0).
cinema(�������_��_��������_��_�����������x,1).
cinema(�����������_�������,1).
cinema(����_������,1).

cinema(��������_��_�����_����,1).
cinema(�����������_�������_������,1).
cinema(��������,1).
cinema(�������������_��������,0).
cinema(�����������,1).

cinema(���,1).
cinema(�������_�����,1).
cinema(�������_������_������������_�_�_���������,0).
cinema(�������_����_��_�����,1).
cinema(����������_�������,1).

question1(X1):-	write("����� ���� � �����"),nl,
				write("1. ����������"),nl,
				write("0. �������"),nl,
                                write("2. ��������"),nl,
                                write("3. �����"),nl,
				read(X1).

question2(X2):-	write("������ ������ �����"),nl,
				write("0. ���"),nl,
				write("1. ������"),nl,
                                write("2.�������� "),nl,
				read(X2).

question3(X3):-	write("���� �� ������ ����� �����"),nl,
				write("1. ��"),nl,
				write("0. ���"),nl,
				read(X3).

question4(X4):-	write("����"),nl,
				write("3. �� 1949"),nl,
				write("2.� 1950 �� 1977"),nl,
				write("1.� 1980 �� 1999"),nl,
				write("0. � 2000 ����"),nl,
				read(X4).

question5(X5):-	write("���� �� �����������"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X5).



pr:-	question1(X1),question2(X2),question3(X3),question4(X4),
		question5(X5),genre(X,X1),country(X,X2),seria(X,X3),
                data(X,X4),cinema(X,X5),write(X),nl,!.
screp([],A,A):-!.
screp([H|T],A,[H|T2]):-screp(T,A,T2).


in_lest([X|_],X):-!.
in_lest([_|T],X):-in_lest(T,X).

kolwo_elements([H|T],K):-k1([H|T],K,1).
k1([_],K,K):-!.
k1([_|T],K,Tt):-T1 is Tt+1,k1(T,K,T1).

all_lest(R):-ales(R,[]),!.
ales(R,RT):-genre(X,_),not(in_lest(RT,X)),screp(RT,[X],RS),ales(R,RS).
ales(R,R):-!.

ales1(R,RT,X1):-aless1(R,[],RT,X1).
aless1([],R,R,_):-!.
aless1([H|T],RT,R,X1):-genre(H,X1)->(screp(RT,[H],RS),aless1(T,RS,R,X1));aless1(T,RT,R,X1).
ales2(R,RT,X1):-aless2(R,[],RT,X1).
aless2([],R,R,_):-!.
aless2([H|T],RT,R,X1):-country(H,X1)->(screp(RT,[H],RS),aless2(T,RS,R,X1));aless2(T,RT,R,X1).
ales3(R,RT,X1):-aless3(R,[],RT,X1).
aless3([],R,R,_):-!.
aless3([H|T],RT,R,X1):-seria(H,X1)->(screp(RT,[H],RS),aless3(T,RS,R,X1));aless3(T,RT,R,X1).
ales4(R,RT,X1):-aless4(R,[],RT,X1).
aless4([],R,R,_):-!.
aless4([H|T],RT,R,X1):-data(H,X1)->(screp(RT,[H],RS),aless4(T,RS,R,X1));aless4(T,RT,R,X1).
ales5(R,RT,X1):-aless5(R,[],RT,X1).
aless5([],R,R,_):-!.
aless5([H|T],RT,R,X1):-cinema(H,X1)->(screp(RT,[H],RS),aless5(T,RS,R,X1));aless5(T,RT,R,X1).

d3_1:-question1(X1),all_lest(R),ales1(R,R1,X1),(kolwo_elements(R1,K1),(1 is K1)->(write(R1),nl);d3_2(R1)).
d3_2(R):-question2(X1),ales2(R,R1,X1),(kolwo_elements(R1,K1),(1 is K1)->(write(R1),nl);d3_3(R1)).
d3_3(R):-question3(X1),ales3(R,R1,X1),(kolwo_elements(R1,K1),(1 is K1)->(write(R1),nl);d3_4(R1)).
d3_4(R):-question4(X1),ales4(R,R1,X1),(kolwo_elements(R1,K1),(1 is K1)->(write(R1),nl);d3_5(R1)).
d3_5(R):-question5(X1),ales5(R,R1,X1),(kolwo_elements(R1,K1),1 is K1,write(R1),nl).



