function main()
    (A, op, B) = readline() |> split
    A = parse(Int, A)
    B = parse(Int, B)
    if op == "+"
        println(A + B)
    else
        println(A - B)
    end
end

main()
