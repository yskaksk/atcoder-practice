function main()
    x = readline() |> x -> parse(Int, x)
    if x < 1200
        println("ABC")
    else
        println("ARC")
    end
end

main()
