function main()
    (a, b, c) = readline() |> split .|> x -> parse(Int, x)
    if (a + b == c || a + c == b || b + c == a)
        println("Yes")
    else
        println("No")
    end
end

main()
