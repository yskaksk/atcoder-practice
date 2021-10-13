function main()
    (N, K) = readline() |> split .|> x -> parse(Int, x)
    K * (K-1)^(N-1) |> println
end

main()
