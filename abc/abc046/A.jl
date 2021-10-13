to_int(x) = parse(Int, x)

function main()
    readline() |> split .|> to_int |> unique |> length |> println
end

main()
