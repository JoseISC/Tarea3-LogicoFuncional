entrada(paella).			calorias(paella,200).
entrada(gazpacho).			calorias(gazpacho, 150).
entrada(pasta).				calorias(pasta, 300).
entrada(ensalada_cesar).	calorias(ensalada_cesar, 180).
entrada(sopa_verduras).		calorias(sopa_verduras, 120).

principal(filete_cerdo).	calorias(filete_cerdo, 400).
principal(pollo_asado).		calorias(pollo_asado, 280).
principal(bisteck_pobre).	calorias(bisteck_pobre, 500).
principal(trucha).			calorias(trucha, 160).
principal(bacalao).			calorias(bacalao, 300).
principal(salmon_plancha).	calorias(salmon_plancha, 350).
principal(lasagna).			calorias(lasagna, 450).

postre(flan).				calorias(flan,200).
postre(naranja).			calorias(naranja,50).
postre(nueces).				calorias(nueces,500).
postre(yogurt).				calorias(yogurt,100).
postre(helado).				calorias(helado,250).

condicioncalorias(C,X,Y,Z) :- calorias(X,XC),calorias(Y,YC),calorias(Z,ZC),((XC+YC+ZC)=<C).
combinaciones(C,X,Y,Z) :- entrada(X),principal(Y),postre(Z),condicioncalorias(X,Y,Z,C).

