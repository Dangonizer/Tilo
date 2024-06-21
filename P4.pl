%spezieller NEA für L_end01

%Zustandsmenge Z
%zustand(Z): Z ist Teil der Zustandsmenge
zustand(z0).
zustand(z1).
zustand(z2).

%Alphabet
%sigma(X): X ist Teil des Alphabets.
sigma(0).
sigma(1).

%Transitionsfunktionen
%delta(AktZ,A,NeuZ): Transition von AktZ zu NeuZ über das Zeichen A.
delta(z0,0,z1).
delta(z0,0,z0).
delta(z0,1,z0).
delta(z1,1,z2).

%Startzustandsmenge Z0
%start(Z): Z ist Teil der Startzustandsmenge.
start(z0).

%Endzustandsmenge E
%end(Z): Z ist Teil der Endzustandsmenge.
end(z2).

%Allgemeiner Teil
%sigma_stern(Ws): Ws ist ein gültiges Wort über dem Alphabet Sigma.
sigma_stern([]).
sigma_stern([A|Ws]) :- sigma_stern(Ws), sigma(A).

%delta_stern(AktZ,Ws,NeuZ): Transition vom Zustand AktZ zu NeuZ über das Wort Ws.
delta_stern(AktZ,[],AktZ).
delta_stern(AktZ,[A|Ws],NeuZ) :- delta(AktZ,A,HelpZ), delta_stern(HelpZ,Ws,NeuZ).

%lvonN(Ws): Wort Ws ist gültiges Wort der Sprache die durch den NEA beschrieben wird.
lvonN(Ws) :- sigma_stern(Ws), start(StartZ), end(EndZ), delta_stern(StartZ,Ws,EndZ).
