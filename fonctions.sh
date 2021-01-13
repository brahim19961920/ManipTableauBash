#!/bin/bash

#A rajouter vérification du type des entrées+ fonction de tri +min+ max+moyenne

#fonction pour remplir un tableau d'entiers
Remplir_tableau(){

echo "entrer le nombre d'entiers du tableau" 
read nb

indice=0
#boucle while pour remplir le tableau
while test $indice -lt $nb
do
	echo "entrer l'élement du tableau d'indice $indice (tab[$indice])"
      	read element
	tab[$indice]=$element
	let indice=$indice+1
done	
}

#Fonction pour afficher les élements d'un tableau
Afficher_tableau()
{

echo "Voici les élements du tableau :"	
for element in ${tab[@]} # ou bien in ${{tab[*]}}
do
	echo $element
done
}

#Fonction retournant le minimum d'un tableau d'entiers
Minimum_tableau(){

minimum=${tab[0]}
for element in ${tab[*]}
do
	if test $minimum -gt $element
	then
		let minimum=$element
	fi
done
echo $minimum
}

#Fonction retournant le maximum d'un tableau d'entiers
Maximum_tableau(){

maximum=${tab[0]}
for element in ${tab[*]}
do
	if test $maximum -lt $element
	then
		let maximum=$element
	fi
done
echo $maximum
}
#Appel des fonctions
Remplir_tableau
Afficher_tableau
echo "Le minimum de ce tableau est :$(Minimum_tableau)"
echo "Le maximum de ce tableau est :$(Maximum_tableau)"







