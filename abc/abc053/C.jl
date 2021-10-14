function main()
    x = readline() |> x -> parse(Int, x)
    n = floor(Int, x / 11)
    r = x - 11 * n
    if r == 0
        println(2*n)
    elseif r <= 6
        println(2*n + 1)
    else
        println(2*n + 2)
    end
end

main()
