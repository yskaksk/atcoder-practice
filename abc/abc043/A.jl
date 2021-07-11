function main()
    N = readline() |> x -> parse(Int, x)
    N * (N + 1) / 2 |> Int |> println
end

main()
