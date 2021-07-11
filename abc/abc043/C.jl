function main()
    N = readline() |> x -> parse(Int, x)
    A = readline() |> split .|> x -> parse(Int, x)
    solve(A) |> println
end

function solve(A)
    m = sum(A) / length(A)
    f = serr(A, floor(Int, m))
    c = serr(A, ceil(Int, m))
    return min(f, c)
end

function serr(A, m)
    return sum([(a - m)^2 for a in A])
end

main()
