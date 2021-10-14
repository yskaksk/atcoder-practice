function main()
    N = readline() |> x -> parse(Int, x)
    S = readline()
    x = 0
    max_x = 0
    for c in S
        if c == 'I'
            x += 1
        else
            x -= 1
        end
        max_x = max(max_x, x)
    end
    println(max_x)
end

main()
