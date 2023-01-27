man(gender).
man(can).
man(rasim).
woman(beyza).
woman(canan).
woman(meryem).

members([],_).
members([M|Ms],Xs) :- select(M,Xs,Ys),members(Ms,Ys).

/* The man who owns the RedBag did not carry Cookies, Chocolate, or Avocado.*/
clue1(Bag) :- members([[P,redbag,_],[_,_,cookies],[_,_,chocolate],[_,_,avocado]],Bag),man(P).
/*Onion was not carried by using RedBag.*/
clue2(Bag) :- members([[_,_,onion],[_,redbag,_]],Bag).
/* beyza owns bluebag, meryem owns yellowbag*/
clue3(Bag) :- member([beyza,bluebag,_],Bag), member([meryem,yellowbag,_],Bag).
/* beyza owns yellowbag, meryem owns bluebag*/
clue3(Bag) :- member([beyza,yellowbag,_],Bag), member([meryem,bluebag,_],Bag).
/*The person who carried the Avocado, who was not Beyza nor Gencer, does not own BlueBag nor the
OrangeBag.*/
clue4(Bag) :- members([[_,_,avocado],[beyza,_,_],[gender,_,_]],Bag),members([[_,_,avocado],[_,bluebag,_],[_,orangebag,_]],Bag).
/*The woman who carried the Cookies owns the YellowBag.*/
clue5(Bag) :- members([[P,yellowbag,cookies]],Bag),woman(P).
/*purplebag belongs can*/
clue6(Bag) :- members([[can,purplebag,_]],Bag).
/*purplebag belongs gender*/
clue6(Bag) :- members([[gender,purplebag,_]],Bag).
/*The Chocolate was not carried with OrangeBag.*/
clue7(Bag) :- members([[_,_,chocolate],[_,orangebag,_]],Bag).
/*Meryem did not carry a food item with the YellowBag nor the GreenBag.*/
clue8(Bag) :- members([[meryem,_,_],[_,yellowbag,_],[_,greenbag,_]],Bag).
/* Onion is carried by Gencer.*/
clue9(Bag) :- member([gender,_,onion],Bag).
/*Nuts were carried with GreenBag and that person was guilty.*/
clue10(Bag,P) :- members([[P,greenbag,nuts]],Bag).


guilty(X) :-
    Bag = [[_,bluebag,_],[_,orangebag,_],[_,redbag,_],[_,purplebag,_],[_,greenbag,_],[_,yellowbag,_]],
    clue1(Bag),
    clue2(Bag),
    clue3(Bag),
    clue4(Bag),
    clue5(Bag),
    clue6(Bag),
    clue7(Bag),
    clue8(Bag),
    clue9(Bag),
    clue10(Bag,X),
    members([[gender,_,_],[can,_,_],[rasim,_,_],[beyza,_,_],[canan,_,_],[meryem,_,_]],Bag),
    members([[_,_,cookies],[_,_,avocado],[_,_,onion],[_,_,nuts],[_,_,chocolate],[_,_,garlic]],Bag),
    write(Bag),
    true.
