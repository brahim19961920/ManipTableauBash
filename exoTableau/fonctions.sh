#!/bin/bash

#Dans ce fichier on manipule des tableaux pour se familiariser avec le syntaxe de bash

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

#premiére méthode pour afficher les élements du tableau
#for element in ${tab[@]} # ou bien in ${{tab[*]}}
#	do
#		echo $element
#	done

#2éme méthode

taille=${#tab[@]}
if test $taille -ne 0 
then
for i in $( eval  echo {0..$(($taille-1))})
do
	echo ${tab[$i]}
done
fi
}

#Fonction retournant le minimum d'un tableau d'entiers
Minimum_tableau()
{
#on vérifie si le tableau n'est pas vide
#{#tab[@]} est la taille du tanleau
if test ${#tab[@]} -eq 0
then
	echo tableau vide
else
minimum=${tab[0]}
for element in ${tab[*]}
do
	if test $minimum -gt $element
	then
		let minimum=$element
	fi
done

echo "Le minimum du tableau est $minimum"
fi
}

#Fonction retournant le maximum d'un tableau d'entiers
Maximum_tableau(){

#Si le tableau est vide
if test ${#tab[@]} -eq 0
then
	echo tableau vide
else
#sinon, on cherche le maximum
maximum=${tab[0]}

for element in ${tab[*]}
do
	if test $maximum -lt $element
	then
		let maximum=$element
	fi
done
echo "Le maximum du tableau est $maximum"
fi
}

#Fonction retournant la moyenne des élements du tableau
Moyenne_tableau()
{
somme=0
nb_elements=${#tab[@]}

#On vérifie que le tableau n'est pas vide
if test $nb_elements -eq 0
then
	echo "tableau vide"
else
	for element in ${tab[*]}
	do
		let somme=$somme+element
	done

	#on utilise | bc -l pour faire une division réelle
	echo "La moyenne des éléments du tableau est $(expr "$somme/$nb_elements" | bc -l)"

fi

}

#fonction pour trier un tableau d'entiers

Tri_tableau()
{
#on vérifie que le tableau n'est pas vide
if test ${#tab[@]} -eq 0
then
	echo "tableau vide"
else
	#taille du tableau
	taille=${#tab[@]}
	for i in $( eval echo {0..$(($taille-1))})
	do
		 indice_minimum=$i
		
		for j in $( eval echo {$(($i))..$(($taille-1))})
		do
			if test ${tab[$j]} -lt ${tab[$indice_minimum]}
			then
				let indice_minimum=$j
			fi
			
		done
		#permute
		temp=${tab[$i]}
		tab[$i]=${tab[$indice_minimum]}
		tab[$indice_minimum]=$temp
	done
fi

}


#Appel des fonctions

Remplir_tableau

Afficher_tableau

Minimum_tableau

Maximum_tableau

Moyenne_tableau

Tri_tableau

echo "Le tableau aprés tri :"
Afficher_tableau

