to_int(x) = parse(Int, x)
function main()
    N = readline() |> to_int
    ratio = [readline() |> split .|> to_int for _ in 1:N]
    (T, A) = (1, 1)
    for r in ratio
        (Ti, Ai) = r
        k = max(ceil(Int, T / Ti), ceil(Int, A / Ai))
        T = BigInt(Ti * k)
        A = BigInt(Ai * k)
    end
    println(T + A)
end

main()
