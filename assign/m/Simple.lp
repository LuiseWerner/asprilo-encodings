#include "../../input.lp".

{ assign(R,S) } :- isRobot(R), isShelf(S).
:- isRobot(R), #count{ S : assign(R,S) } > 1.
:- isShelf(S), #count{ R : assign(R,S) } > 1.
%273 Models

%Alternative
%:- assign(R,S), assign(R',S), R<R'.
%:- assign(R,S), assign(R,S'), S<S'.
%273 Models

%--------------------------------------------------------------------------------
%successful reduced to the right 2 models from the 273 generated models,
%using Instanzen/moo/structured/1x2x4/100sc/r02/x11_y6_n66_r2_s16_ps1_pr16_u16_o2_N001.lp
%--------------------------------------------------------------------------------

%funktionierende einzelne Zeilen
:- ordered(O,A), #count{ S : assign(R,S), shelved(S,A) } != 1.	%2	vermeiden, dafür "< 1", "> 1" in zwei Zeilen
%:- ordered(O,A), #count{ S : assign(R,S), shelved(S,A) } < 1.	%2 (%:- ordered(O,A), #count{ S : assign(R,S), shelved(S,A) } > 1.	%273)
%:- ordered(O,A), #count{ S : assign(R,S), shelved(S,A) } = 0.	%2
%:- ordered(O,A), #count { S : assign(R,S), shelved(S,A), target(O,P) } = 0.	%2
%:- ordered(O,A), shelved(S,A), #count{ S : assign(R,S) } != 1.	%2
%:- ordered(O,A), shelved(S,A), #count{ R : assign(R,S) } != 1.	%2

%funktionierende zusammengesetzte Zeilen 1
%:- shelved(S,A), assign(R,S), #count{ O : ordered(O,A) } != 1.	%7
%:- ordered(O,A), #count{ S : assign(R,S) } = 0.             	%272 (nimmt leere Menge raus, geht auch ohne Aggregat darzustellen)
%:- 0 != #sum{ 1,O : isOrder(O); -1,R,S : assign(R,S) }.	%141, mit %7 und %272 2 (Bedeutung: Anzahl orders = Anz. assigns)

%funktionierende zusammengesetzte Zeilen 2
%:- shelved(S,A), assign(R,S), #count{ O : ordered(O,A) } != 1.	%7
%:- ordered(O,A), #count{ S : assign(R,S) } = 0.             	%272 (nimmt leere Menge raus, geht auch ohne Aggregat darzustellen)
%:- 0 < #sum{ 1,O : isOrder(O); -1,R,S : assign(R,S) }.	     	%<¬
%:- 0 > #sum{ 1,O : isOrder(O); -1,R,S : assign(R,S) }.	     	%siehe oben, aber <,> statt !=


%funktionierende zusammengesetzte Zeilen 2
%assigned(O) :- ordered(O,A), shelved(S,A), assign(_,S).	%<¬
%:- ordered(O,A), not assigned(O).				%2 mit oben

%------------------------------------------------------------------------
%failed
%------------------------------------------------------------------------

%1:1-Zuweisung: das geht nicht, da es ja auch nicht zugeordnete Regale und Roboter geben kann
%:- isRobot(R), #count{ S : assign(R,S) } != 1.
%:- isShelf(S), #count{ R : assign(R,S) } != 1.
%0

%halb zusammengesetze, auf Fall angepasste
%:- #count{ S : assign(R,S) } = 1.  		      	%241 allein, 3 mit %7, 2 mit %7 und %272, aber angepasst auf diesen Fall
%:- ordered(O,A), #count{ S : assign(R,S) } != 2. 	%2, aber angepasst auf diesen Fall

%keinen Effekt
%:- ordered(O,A), #count{ S : shelved(S,A) } = 0.	%273
%:- assign(R,S), #count{ S : shelved(S,A) } = 0.	%273
%:- assign(R,S), #count{ O : ordered(O,A) } = 0.	%273

%unsat bzw. nicht alle Lösungen
%:- shelved(S,A), #count{ S : assign(R,S) } = 0.	%0
%:- shelved(S,A), #count{ O : ordered(O,A) } = 0.	%0
%:- #count{ R,O : assign(R,S), isOrder(O) } != 1.	%0
%:- ordered(O,A), #count{ S : assign(R,S) } != 1.	%32 aber macht unsat!
%:- isOrder(O), #count{ (R,S) : assign(R,S) } > 1. 	%33 dann unsat
%:- #count{ S : ordered(O,A), shelved(S,A), assign(R,S) } != 1. %60 allein, 4 mit %7 aber dann unsat
%:- #count{ S : assign(R,S) } != 1.	    		%60 allein, 4 mit %7 aber dann unsat
%:- 0 = #sum{ 1,O : isOrder(O); -1,R,S : assign(R,S) }.	%33 dann unsat
%:- ordered(O,A), assign(R,S), assign(R',S'), shelved(S,A), shelved(S',A'), R<R', S<S'.	%247, aber nur 1 Lösung dabei

%leere Menge Lösung
%:- not shelved(S,A), assign(R,S), isProduct(A).	%1 leer
%:- assign(R,S), #count{ O : ordered(O,A) } != 1.	%1 leer

%weitere gescheiterte Ansätze
%:- not assign(R,S), isRobot(R), ordered(O,A), shelved(S,A).
%:- not assign(R,S), isRobot(R), isOrder(O), isShelf(S).	%0
%:- assign(R,S), not ordered(O,A), isOrder(O), isProduct(A).
%:- isShelf(S), ordered(O,A), not shelved(S,A), assign(R,S).
%:- assign(R,S), not shelved(S,A), isProduct(A), ordered(O,A), isOrder(O).

#show assign/2.