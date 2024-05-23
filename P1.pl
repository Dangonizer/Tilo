%eltern(X,Y): X ist Elternteil von Y.
eltern(sibylle,kevin).
eltern(roger,kevin).
eltern(karl,sibylle).
eltern(karl,christa).
eltern(karl,hubert).
eltern(martha,sibylle).
eltern(martha,christa).
eltern(martha,hubert).
eltern(opa2,roger).
eltern(oma2,roger).
eltern(christa,petra).
eltern(peter,petra).

%male(X): X ist männlich.
male(karl).
male(kevin).
male(roger).
male(hubert).
male(peter).
male(opa2).

%female(x): X ist weiblich.
female(oma2).
female(sibylle).
female(martha).
female(christa).
female(petra).


% vater(X,Y): X ist Vater von Y.
vater(X,Y):-eltern(X,Y),male(X).

% mutter(X,Y): X ist Mutter von Y.
mutter(X,Y):-eltern(X,Y),female(X).

%sohn(X,Y): X ist Sohn von Y.
sohn(X,Y):-eltern(Y,X),male(X).

%tochter(X,Y): X ist Tochter von Y.
tochter(X,Y):-eltern(Y,X),female(X).

%bruder(X,Y): X ist Bruder von Y.
bruder(X,Y):-vater(V,X),vater(V,Y),mutter(M,X),mutter(M,Y),male(X),X\==Y.

%schwester(X,Y): X ist Schwester von Y.
schwester(X,Y):-vater(V,X),vater(V,Y),mutter(M,X),mutter(M,Y),female(X),X\==Y.

%geschwister(X,Y): X und Y sind Geschwister.
geschwister(X,Y):-vater(V,X),vater(V,Y),mutter(M,X),mutter(M,Y),X\==Y.

%onkel(X,Y): X ist Onkel von Y.
onkel(X,Y):-eltern(Z,Y),bruder(X,Z).

%cousine(X,Y): X ist Cousine von Y.
cousine(X,Y):-eltern(Z,X),eltern(W,Y),geschwister(Z,W),female(X).

%großvater(X,Y): X ist Großvater von Y.
großvater(X,Y):-eltern(Z,Y),vater(X,Z).
