
//Dans ce fichier on implémente uen fonction pour trier un tableau d'entiers
//Je sais qu'on peut utiliser std::sort! Je fais cet exercice pour vérifier lalogorithme que je vais utiliser pour trier un tableau en bash!
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

//permuter le contenu de deux variables de type int
void permute(int& a, int& b)
{int temp=a;
a=b;
b=temp;
}

//Fonction tri 
void tri(vector<int>& tab)

{for (int i=0;i<tab.size();i++)
{
int ind_min=i;//la variable i contient l'indice du minimum du tableau à partir de tab[i] 

//boucle pour trouver ind_min
for (int j=i+1;j<tab.size();j++)
{
if (tab[j]<tab[ind_min])
	ind_min=j;
}
// permuter l'élement d'indice i et l'élement d'indice ind_min
permute(tab[i],tab[ind_min]);
}
}

int main(){
//Test de la fonction tri dans le programme principal
vector<int> tab={123,42,567,8,9,87,65,4,3,88,'t',99,10,5};
tri(tab);
//sort(tab.begin(),tab.end());// Je rappelle la possibilité d'utiliser sort
//Affichage des élements du tableau
for (int i=0;i<tab.size();i++)
	cout<<tab[i]<<endl;
return 0;}






