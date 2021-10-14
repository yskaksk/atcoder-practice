function main()
    N = readline() |> x -> parse(Int, x)
    A = readline() |> split .|> x -> parse(Int, x)
    if is_ok(A)
        solve(N) |> println
    else
        println(0)
    end
end

function is_ok(A)
    # nが偶数のとき
    #   1からn-1までの奇数がちょうど2回ずつ現れる
    # nが奇数のとき
    #   0がちょうど1回、2からn-1までの偶数はちょうど2回ずつ現れる
    n = length(A)
    if n % 2 == 0
        count = Dict(k => 2 for k in 1:2:n-1)
    else
        count = Dict(k => 2 for k in 2:2:n-1)
        count[0] = 1
    end
    for a in A
        c = get(count, a, 0)
        c == 0 && return false
        count[a] = c - 1
    end
    return true
end

function solve(N)
    # 2^(floor(N/2))を計算すれば良い
    n = floor(Int, N / 2)
    powermod(2, n, 1_000_000_007)
end

main()
