to_int = x -> parse(Int, x)

function main()
    N = readline() |> to_int
    T = readline() |> split .|> to_int
    M = readline() |> to_int
    S = sum(T)
    result = Vector{Int}(undef, M)
    for i in 1:M
        (Pi, Xi) = readline() |> split .|> to_int
        result[i] = S - T[Pi] + Xi
    end
    for r in result
        println(r)
    end
end

main()
