function main()
    (A, B, C, D) = readline() |> split .|> x -> parse(Int, x)
    if A * B > C * D
        println(A * B)
    else
        println(C * D)
    end
end

main()
