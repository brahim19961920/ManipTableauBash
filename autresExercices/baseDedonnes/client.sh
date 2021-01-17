#!/bin/bash

#Ce fichier permet de génerer des requettes SQL à partir des deux fichiers agences.csv et clients.csv
#Les requettes seront stockés dans le fichier source.sql
#Si une ligne du fichier clients.csv contient des erreurs (codePostal n'existe pas dans le fichier agences.csv) celle-ci sera stockée dans le fichier erreur.log

while read ligne 
do
	id=$(echo $ligne|cut -d ";" -f 1)
	nom=$(echo $ligne|cut -d ";" -f 2)
	prenom=$(echo $ligne|cut -d ";" -f 3)
	codePostal=$(echo $ligne|cut -d ";" -f 4)
	telephone=$(echo $ligne|cut -d ";" -f 5)
	montantAchats=$(echo $ligne|cut -d ";" -f 6)
	if  [ $id = "Id" ] 
	then
		continue
	else
		grep $codePostal $2 >>/dev/null 2>&1
		if test $? -eq 0
		then
			echo "INSERT INTO client(id,nom,prenom,codePostal,telephone,montantAchats) Values('$id','$nom','$prenom','$codePostal','$telephone','$montantAchats');">>source.sql
		 
		else
		echo $ligne>>erreur.log
		fi
	fi
done <$1



