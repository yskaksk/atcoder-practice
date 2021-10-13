function main()
    (N, x) = readline() |> split .|> x -> parse(Int, x)
    a = readline() |> split .|> x -> parse(Int, x)
    first = a[1]
    count = 0
    for second in a[2:end]
        if first + second <= x
            first = second
        else
            diff = first + second - x
            count += diff
            if second >= diff
                first = second - diff
            else
                first = 0
            end
        end
    end
    println(count)
end

main()
