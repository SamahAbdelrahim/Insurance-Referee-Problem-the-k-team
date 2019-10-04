%Hard Constraints
{assign(F,A):referee(A,B,C,D,E)} = 1 :- case(F,G,H,T,J,S).
%not R > C:- R = #sum{H ,F :assign(F,A),case(F1,G1,H,T,J,S),F==F1}, referee(A,B,C,D,E). 
allwork(FF,A):- FF=R+D, R =#sum{H,F1:assign(F1,A),case(F1,G1,H,T,J,S)}, referee(A,B,C,D,E). 
:-allwork(FF,A),FF>C, assign(F1,A),case(F1,G1,H,T,J,S),referee(A,B,C,D,E).
:-assign(F,A),referee(A,B,C,D,E),case(F,G1,H,T,J,S),prefType(A1,G,P),G==G1,A1==A, P==0. 
:-assign(F,A),referee(A,B,C,D,E),case(F,G1,H,T,J,S),prefRegion(A1,G,P),G==J,A1==A, P==0.
:-assign(F,A),referee(A,B,C,D,E),case(F,G1,H,T,J,S),externalMaxDamage(M), T > M , B == i .

%Weak Constraints
ecost(Z):- Z=#sum{20,A:assign(F,A),referee(A,B,C,D,E),case(F,G1,H,T,J,S),B1==B, B1 == e } . 
#minimize{Z:ecost(Z)}.

overall(X,A):- X=O+E ,O=#sum{S,A:assign(F1,A),case(F1,G1,H,T,J,S)} , referee(A,B,C,D,E), B==e . 
number(Y):- Y=#count{1:referee(A,B,C,D,E), B==e } .
summ(K):-K=#sum{X:overall(X,A)} .
avg(V) :- V = K/Y , summ(K) , number(Y) .
:~ assign(F,A) , referee(A,B,C,D,E) , case(F,G,H,T,J,S) ,overall(X,A), B==e ,avg(V), PEN =|V-X|. [PEN,A]
#minimize{PEN,A: assign(F,A) , referee(A,B,C,D,E) , case(F,G,H,T,J,S) ,overall(X,A), B==e ,avg(V), PEN =|V-X|}.


overallw(XW,A):- XW=OW+D ,OW=#sum{H,A:assign(F1,A),case(F1,G1,H,T,J,S)} , referee(A,B,C,D,E).
numberw(YW):- YW=#count{1:referee(A,B,C,D,E)} .
summw(KW):-KW=#sum{XW:overall(XW,A)} .
avgw(VW) :- VW= KW/YW , summw(KW) , numberw(YW) .
:~ assign(F,A) , referee(A,B,C,D,E) , case(F,G,H,T,J,S) ,overallw(XW,A),avgw(VW), PENW =|VW-XW|. [PENW,A]
#minimize{PENW,A: assign(F,A) , referee(A,B,C,D,E) , case(F,G,H,T,J,S) ,overallw(XW,A),avgw(VW), PENW =|VW-XW|}.


:~ assign(F,A),referee(A,B,C,D,E),case(F,G1,H,I,J,S),prefRegion(A,G,P),G==J, U =|3-P|. [U,A]
#minimize {U,A:assign(F,A),referee(A,B,C,D,E),case(F,G1,H,I,J,S),prefRegion(A,G,P),G==J, U =|3-P|} . 

:~ assign(F,A),referee(A,B,C,D,E),case(F,G1,H,I,J,S),prefType(A,G,P),G==G1, W =|3-P|. [W,A]
#minimize {W,A:assign(F,A),referee(A,B,C,D,E),case(F,G1,H,I,J,S),prefType(A,G,P),G==G1, W =|3-P|} .
 
#show assign/2 .