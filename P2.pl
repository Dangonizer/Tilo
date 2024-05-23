%append(Xs,Ys,Rs): Xs wird vornen an Ys angehangen um Rs zu bilden.
append(nil,Xs,Xs).
append(list(X,Xs), Ys, list(X,Rs)):- append(Xs,Ys,Rs).

%linListe(Xs): Xs ist valide linked list.
linListe(nil).
linListe(list(_X,Xs)) :- linListe(Xs).

%mem(X,Ys): X ist Element von Ys.
mem(X,list(X,Xs)) :- linListe(Xs).
mem(X,list(_,Xs)) :- mem(X,Xs), linListe(Xs).

%infix(Xs,Ys): Xs in Ys enthalten.
infix(Xs,Ys) :- append(_,Xs,R1), append(R1,_,Ys), linListe(Xs), linListe(Ys).

%attach(Xs,X,Ys): Ys ist Xs um X verlängert.
attach(Xs,X,list(X,Xs)) :- linListe(Xs).

%rev(Xs,Ys): Ys ist Xs rückwärts.
rev(nil,nil).
rev(list(X,Xs),Ys) :- rev(Xs,Hs), append(Hs,list(X,nil),Ys).

%binbaum(X): Prüft ob X ein gültiger Binärbaum ist
binbaum(e).
binbaum(n(_,Lb,Rb)) :- binbaum(Lb),binbaum(Rb).

%construct(Root,Lb,Rb,Xneub): X ist ein Binärbaum mit dem Wurzelknotenwert Root und den Kindern Lb,Rb.
construct(Root,Lb,Rb,n(Root,Lb,Rb)) :- binbaum(n(Root,Lb,Rb)).

%natSym(X): X ist valides NatSym(Succesor von o).
natSymb(o).
natSymb(s(X)):- natSymb(X).

%add(X1,X2,R): X1 + X2 = R.
add(X,o,X):- natSymb(X).
add(X,s(X2),s(E)):- add(X,X2,E).

%knotenanz(Xb,N): N ist die Anzahl der Knoten des Baums Xb in szmbolischer Darstellung.
knotenanz(e,o).
knotenanz(n(_,Lb,Rb),s(S)) :- knotenanz(Lb,N1), knotenanz(Rb,N2), add(N1,N2,S).
