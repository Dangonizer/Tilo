%Spezifischer PDA L_agb

%Zustandsmenge
%zustand(Z): Z ist Teil der Zustandsmenge
zustand(z).

%Alphabet
%sigma(X): X ist Teil des Alphabets.
sigma(a).
sigma(b).

%Kelleralphabet
%gamma(X): X ist Teil des Kelleralphabets.
gamma(a).
gamma(b).
gamma(s).

%Transitionsrelationen
%delta(AktZ,A,PopS,NeuZ,WriteS): Transition von AktZ zu NeuZ. Zeichen A wird gelesen, PopS wird oben vom Stack entnommen, WriteS wird oben auf den Stack geschrieben.
delta(z,a,a,z,[]).
delta(z,b,b,z,[]).
delta(z,nix,s,z,[]).
delta(z,nix,s,z,[a,s,b]).

%Startzustand
%start(Z): Z ist der Startzustand.
start(z).

%Kellerboden
%floor(A): A ist Kellerbodensymbol
floor(s).

%Allgemeiner Teil

%sigma_stern(Ws): Ws ist ein gültiges Wort über dem Alphabet Sigma.
sigma_stern([]).
sigma_stern([A|Ws]) :- sigma_stern(Ws), sigma(A).

%gamma_stern(Ws): Ws ist ein gültiges Wort über dem Kelleralphabet Gamma.
gamma_stern([]).
gamma_stern([A|Ws]) :- gamma_stern(Ws), gamma(A).

%es(AktZ,AktWs,AktSs,NeuZ,NeuWs,NeuSs): Der Übergang vom Zustand AktZ zu NeuZ, Eingabe AktWs zu NeuWs und dem Keller AktSs zu NeuSs ist ein gültiger Einzelschritt des PDAs.
es(Z, Ws, [G|Ss], Zstrich, Ws, SstrichSs) :- zustand(Z), zustand(Zstrich), sigma_stern(Ws), gamma(G), gamma_stern(Ss), delta(Z,nix,G,Zstrich,Sstrichs),append(Sstrichs,Ss,SstrichSs).
es(Z, [A|Ws], [G|Ss], Zstrich, Ws, SstrichSs) :- zustand(Z), zustand(Zstrich), sigma(A), sigma_stern(Ws), gamma(G), gamma_stern(Ss), delta(Z,A,G,Zstrich,Sstrichs),append(Sstrichs,Ss,SstrichSs).

%es_plus(AktZ,AktWs,AktSs,NeuZ,NeuWs,NeuSs): Der Übergang vom Zustand AktZ zu NeuZ, Eingabe AktWs zu NeuWs und dem Keller AktSs zu NeuSs ist ein gültiger transitiver Abschluss der Einzelschrittrelationen des PDAs.
es_plus(Z,Ws,Ss,Zneu,Wneus,Sneus) :- es(Z,Ws,Ss,Zneu,Wneus,Sneus).
es_plus(Z,Ws,Ss,Zneu,Wneus,Sneus) :- es(Z,Ws,Ss,ZH,WHs,SHs), es_plus(ZH,WHs,SHs,Zneu,Wneus,Sneus).

%lvonM(Ws): Ws ist ein gültiges Wort der Sprache die vom PDA M dargestellt wird.
lvonM(Ws) :- sigma_stern(Ws), start(Z0), floor(S), zustand(Z), es_plus(Z0,Ws,[S],Z,[],[]).

