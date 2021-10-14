function main()
    n = readline() |> x -> parse(Int, x)
    s = readline() |> x -> parse(Int, x)
    solve(n, s) |> println
end

function f(b, n)
    function  inner(b, n, s)
        n == 0 && return s
        return inner(b, floor(Int, n / b), s + n % b)
    end
    return inner(b, n, 0)
end

function solve(n, s)
    for b in 2:n+1
        f(b, n) == s && return b
    end
    return -1
end

main()
