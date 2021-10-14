function main()
    (H, W) = readline() |> split .|> x -> parse(Int, x)
    for _ in 1:H
        l = readline()
        println(l)
        println(l)
    end
end

main()
