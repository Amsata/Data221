#=
****************************
*****EXEMPLE DE FONCTIONS***
****************************
=#

# parse(): convertir une chaine en d'autre types

x="20"
typeof(x)
parse(Int64,x)

# cos() : calcule le cosinus d'autre nombres

cos(pi)
cos(0)

# log2(): calcul le logarithme en base 2
#log2(x)=log(x)/log(2)
log2(2)

#=
*******************************************
*****CONSTRUIRE UNE FONCTION SUR Julia*****
*******************************************

structure de base

function name(args)
    body
end

=#

# fonction qui addition deux nombre

function addition(x,y)
    return(x+y)
end

addition(1,3)

addition(3,addition(3,7))
# on peut utiliser une fonction comme argument

# afficher le nombre saisi

function afficher(nombre)
    println("Vous avez saisi $nombre")
    # notez la maniere d'inclure une varialb dans println
end

afficher(3)
