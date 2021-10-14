function main()
    (sx, sy, tx, ty) = readline() |> split .|> x -> parse(Int, x)
    W = tx - sx
    H = ty - sy
    (U, D, L, R) = "UDLR"
    l = (W + H + 2) * 4
    result = [
        repeat([U], H);
        repeat([R], W+1);
        repeat([D], H+1);
        repeat([L], W+1);
        [U];
        [L];
        repeat([U], H+1);
        repeat([R], W+1);
        repeat([D], H+1);
        repeat([L], W)
    ]
    println(String(result))
end

main()
