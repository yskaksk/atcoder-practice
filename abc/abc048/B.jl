function main()
    (a, b, x) = readline() |> split .|> x -> parse(BigInt, x)
    count = floor(BigInt, b / x) - floor(BigInt, (a - 1) / x)
    println(count)
end

main()
