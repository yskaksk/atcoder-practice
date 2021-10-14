function main()
    N = readline() |> x -> parse(Int, x)
    K = readline() |> x -> parse(Int, x)
    X = readline() |> x -> parse(Int, x)
    Y = readline() |> x -> parse(Int, x)

    r = X * N
    if N > K
        r += (Y - X) * (N - K)
    end
    print(r)
end

main()
