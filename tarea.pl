%The people who will go on each side and in the boat are determined.
canibal(c1).
canibals(c2,c3).
canibals(c1,c2).
missionaries(m1,m2).
missionaries(m2,m3).
missioables(m1,c1).
missionary(m1).
missionary(m2).
missionary(m3).


%move 1 : canibal 1 is in the left and missionary 1 is back
forward(m1,c1,1,1,0,1).
backward(m1,c1,0,1).

%move 2 : canibal 2 is in the left side and missionary 1 is back
forward(c2,c3,0,1,0,2).
backward(c2,c3,0,2).

% move 3 : missionary 1 is in the left side and missionary 2 is back
% with canibal 2
forward(m1,m2,0,2,11,1).
backward(m1,c2,11,1).

% move 4 : missionary 2 and missionary 3 are in left and canibal 1 is
% back
forward(m2,m3,11,1,3,0).
backward(c1,c1,3,0).

%move 5 : canibal 1 is in the left and canibal 2 is back
forward(c1,c2,3,0,3,1).
backward(c1,c2,3,1).

%move 6 : canibal 2 and 3 move to the right
forward(c2,c3,3,1,3,3).
backward(0,0,3,3).
% its going to show how the individuals move in the boat.
move(X1,X2, X,Y):-
	missionaries(M,M1),missionary(M),
	forward(m2,M1,X,Y,MisL,CanL),backward(C,C,MisL,CanL),
	write('missionary'),write(M),write(' and missionary '),write(M1),write(' crosses the river '),nl,write('cannibal'),write(C),write(' is going back'),X1 is MisL ,X2 is CanL,nl,nl,nl.

move(X1,X2, X,Y):-
	missionaries(M,M1),
	forward(M,M1,X,Y,MisL,CanL),backward(M,C,MisL,CanL),
	write('missionary'),write(M),write(' and missionary '),
	write(M1),write(' crosses the river '),nl,write('missionary '),write(M1),write(' is going back with a cannibal '),write(C),
	X1 is MisL ,X2 is CanL,nl,nl.

move(X1,X2, X,Y):-
	canibals(M,C),forward(M,C,X,Y,MisL,CanL),
	E is MisL ,F is CanL ,backward(Q,R,E,F),Q = 0,R = 0 ,
	write('missionary '),write(M),write(' and cannibal '),write(C),write(' crosses the river '),nl,write(' This is all. '),
	X1 is E ,X2 is F,nl,nl.

move(X1,X2, X,Y):-
	canibals(M,C),
	forward(M,C,X,Y,MisL,CanL),
	E is MisL ,F is CanL ,backward(M,C,E,F),
	write('missionary '),write(M),write(' and cannibal '),write(C),write(' cross the river '),nl,write('missionary'),write(M),write(' is in the right side and cannibal '),write(C),write(' go back '),
	X1 is E ,X2 is F,nl,nl.


move(X1,X2, X,Y):-
	missioables(M,C),missionary(M),canibal(C),
	forward(M,C,X,Y,MisL,CanL),
	E is MisL ,F is CanL ,backward(M,C,E,F),
	write('missionary '),write(M),write(' and cannibal '),write(C),write(' cross the river '),nl,write('canibal '),write(C),write(' is in the right side and missionary '),write(M),write(' go back '),
	X1 is E ,X2 is F,nl,nl.



%initial state
go([_,_,_,3,3]).

go([1,1,0,0,0]):-
	move(X1,X2, 1,1),Nm is 1 ,go([MisL,CanL,Nm,X1,X2]).

go([LMis,LCan,M,RM,RC]):-
	move(X1,X2, RM,RC),Nl is M + 1 ,go([MisL,CanL,Nl,X1,X2]).

start():-
	go([1,1,0,0,0]).





















