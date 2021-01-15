#!/bin/bash

#Ce script permet de vérifier si les mails contenus dansun fichier .txt passé en argument ont un bon format



#fonction permettant d'afficher le fichier mail.txt en indiquant à chaqu eligne si le mail est valide ou pas
verification_format(){

for ligne in $(cat mail.txt)
do 	
	#utilisation de grep et des expressions réguliéres pour faire le teste pour chaque ligne

	echo $ligne|grep ".*@.*\\..\\+" >>/dev/null 
	if test $? -eq 0
       	then
	       	echo "$ligne : mail valide" 
	else 
		echo "$ligne : mail invalide"
	fi
	done

}

# avant d'appeler la fonction verification_format on s'assure que le nombre d'arguments passés au fichier est égal à 1 et que celui-ci correspond bien à mail.txt
if [[ $# -ne 1 ]]
then
	echo "il faut executer le script avec un seul argument (le nom du ficheir .txt contennat les mails"
else
	ls $1>> /dev/null 2>&1 
	if test $? -ne 0  
	then
		echo "le fichier mail.txt n'existe pas dans ce répertoire."
	else
		verification_format	
	fi	


fi



















