README :

Donc cet aprem j'ai, ajouté le wake up ecran+led / interuption avec les boutons
ajoute le fait que la led orange s'allume quand l'alarme est on
ajoute la verification de l'heure du reveil dans les limites 00:00 23:59
sur l'ecran d'accueil, quand l'alarme est ON, j'indique l'heure.

j'ai fait des fichiers différents. Le test_correct est censé être la bonne version backup.
sinon test_milli et test_lowPrior
Parce que j'avais essaye de regle nos 2 derniers soucis separement, mais pas encore reussi.

J'ai demande a l'assistant pour le truc de low priority, il a juste dis de bien reflechir a comment ca se passe dans les interruption, genre, si ca passe pas c'est que la clock prend tout le temp (et je ne devrais pas) ...
La, je ne trouve pas.
Sinon pour le truc millisec, en refesant les calculs, j'ai :
25 000 000 / 1000 = 25 000 //millisec
25 000 / 4 = 6250 //4 instr
65536 - 6250 = 0xE976 mais sur l'ecran c'est trop lent, genre ca affiche 1 sec toute les 2 secondes réelles
