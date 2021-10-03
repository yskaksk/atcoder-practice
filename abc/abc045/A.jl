function main()
    a = readline() |> x -> parse(Int, x)
    b = readline() |> x -> parse(Int, x)
    h = readline() |> x -> parse(Int, x)

    s = (a + b) * h / 2
    print(Int(s))
end

main()
