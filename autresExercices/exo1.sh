#!/bin/bash


#fonction retourant des inforamtions concernat l'espace disk
disk_space()
{
	df -h
}

#fonction retournant l'utilisatuer connecté
users()
{
	who
}




#programme principale 
#Menu prposant l'execution des des deux fonctions défines ci-dessus
while :
	do
		echo -e "Choisir une option :\n1:Afficher les utilisateurs connectés\n2:Afficher l'espace disk\nPour quitter le programme, tapez n'importe quel autre caractére"
		read choix
		case $choix in
			1) 	echo "Les utilisateurs connectés"
				users
				;;
			2)	echo "L'espace disk"
				disk_space
				;;
			*) 
				exit
				;;
		esac
		done















