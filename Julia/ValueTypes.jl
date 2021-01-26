#=
Les types de valeur de base en julia sont:
1. Int64: pour les entier
2. Float64: pour les nombres réels
3. String: pour les chaines de caractere
4. Bool pour les bouléns
Pour voire le type d'un object Julia on utilise
la commande : typeof
=#

x=2
y=2.3
s="Amsata"
b=true

typeof(x)

typeof(y)

typeof(s)

typeof(b)

#=
On peux convertir, dans la mesure du possible,
un type de valeur à un autre avec la fonction parse()
=#


x="2"
typeof(x)

y=parse(Int64,x)

typeof(y)

z="true"

typeof(z)

#impossible
parse(z,Bool)

z=true
#impossible
parse(Int64, z)

#On ne peut convertir que des nombres representé en haine de caracteres
