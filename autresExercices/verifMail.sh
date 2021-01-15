#!/bin/bash
#Ce script permet de vérifier si les mails contenus dansun fichier .txt passé en argument ont un bon format


verification()
{
if test $# -ne 1
then
	echo "il faut executer le script avec un seul argument (le nom du ficheir .txt contennat les mails"
else
	ls $1 2&>>1 /dev/null
	if $


















