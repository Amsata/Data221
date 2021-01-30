
#= CONTROLE avec if

syntaxe

if condition
    body
end
=#
#EXEMPLEx
x=10
if x%2==0
    println("$x est un nombre paire")
end

#= If avec else

if condition
    true_body
else
    false_body
end

=#

x=11

if x%2==0
    println("$x est un nombre paire")
else
    println("$x est un nombre impaire")
end

#= if et elseif

if condition
    body
elseif condition

end
=#
x="amsata"

if typeof(x)!=Int64
    println("incorrete input")
elseif x%2!=0
    println("$x est un nombre impaire")
else
    println("$x est un nombre paire")
end



    
