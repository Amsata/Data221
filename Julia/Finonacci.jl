function fib(n)
    if n<0
        println("n ne doit pas être négatif")
    elseif n==1
        return(1)
    else
    return fib(n-1) #+ fib(n-2)
    end
 end

fib(1)


FIB(n) = (n == 1 || n==2) ? 1 :  FIB(n - 1)+FIB(n-2)


using Pkg

Pkg.add("BenchmarkTools")
@btime FIB(30)
