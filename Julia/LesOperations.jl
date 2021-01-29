#=

LES OPERATIONS ARITHMETIQUES

+: addition
-: soustraction
/: division
^: exposant
%: division modulo (rste de la division)

=#

x=10;z=3;y=9

x+y

x*z

x/z
x%z

x^z

x+=y # x=x+y

x*=y #x=x*y

x\y #la meme chaose que y/x
#=
LES OPERATEURS DE COMPARAISON: ils renvoient des objet de
type Bool comme resultat

> :superieur
>=: superieur ou egal
<: inferieur
<=: inferieur ou egale
==: egale
!=: different
=#

x>y
x==z
x!=z
z<=x

true==true

(true & false) # vraie et faux=faux

true | false #vraie ou faux =vraie

#on peut contruire des combinaiqon complexe de bouléns


#=
****************************************
*OPERATIONS SUR LES CHAINE DE CARACTERE*
****************************************

en général on n'effectue pas d'operation mathémaiques
sur les chaine de caractère. Mais sur Julia il y a une xeption
pour les opérateurs * ^

*: concatenation de chaine de caractere
^(n):concatenation n fois

=#
n="Amsata"
p=" Amsata"

n*p

p^2
# l'exposant doit toujours être un entier
