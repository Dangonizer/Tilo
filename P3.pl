%app(Xs,Ys,Rs): Xs wird vornen an Ys angehangen um Rs zu bilden.
app([],Xs,Xs).
app([X|Xs], Ys, [X|Rs]):- app(Xs,Ys,Rs).

% präfix(Xs,Ys): Ys beginnt mit der Liste Xs.
präfix(Xs,Ys) :- app(Xs,_,Ys).

%postfix(Xs,Ys): Ys endet mit Xs.
postfix(Xs,Ys) :- reverse(Ys,YRs), reverse(Xs,XRs), präfix(XRs,YRs).
postfix(Xs,Ys) :- append(_,Xs,Ys).

%binbaum(X): Prüft ob X ein gültiger Binärbaum ist
binbaum(e).
binbaum(n(_,Lb,Rb)) :- binbaum(Lb),binbaum(Rb).

%membertree(X,Xb): X ist in Baum Xb enthalten.
membertree(X,n(X,Lb,Rb)) :- binbaum(n(X,Lb,Rb)).
membertree(X,n(_,Lb,_)) :- membertree(X,Lb).
membertree(X,n(_,_,Rb)) :- membertree(X,Rb).

%präorder(Xb,Ys): Ys ist die Liste aller Knotenbeschriftungen der Knoten des Binärbaums Xb in Präorder.
präorder(e,[]).
präorder(n(X,Lb,Rb),Ys) :- präorder(Lb,Ls), präorder(Rb,Rs), append([X],Ls,Hs), append(Hs,Rs,Ys).

%postorder(Xb,Ys): Ys ist die Liste aller Knotenbeschriftungen der Knoten des Binärbaums Xb in Postorder.
postorder(e,[]).
postorder(n(X,Lb,Rb),Ys) :- postorder(Lb,Ls), postorder(Rb,Rs), append(Ls,Rs,Hs), append(Hs,[X],Ys).

%roots(Xbs,Ys): Ys ist die Liste der Wurzelknotenbeschriftungen der Bäume in der Liste Xbs.
roots([],[]).
roots([e|XbRs],Ys) :- roots(XbRs,Ys).
roots([n(X,_,_)|XbRs],[X|Ys]) :- roots(XbRs,Ys).
