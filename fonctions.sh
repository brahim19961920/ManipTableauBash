#!/bin/bash

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

#Appel des fonctions

Remplir_tableau
Afficher_tableau









