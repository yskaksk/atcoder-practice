function main()
    (K, S) = readline() |> split .|> x -> parse(Int, x)
    count = 0
    for x in 0:K, y in 0:K
        z = S - (x + y)
        if z > K || z < 0
            continue
        end
        count += 1
    end
    println(count)
end

main()
