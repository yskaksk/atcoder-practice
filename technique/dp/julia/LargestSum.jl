function main()
    a = readline() |> split .|> x -> parse(Int, x)
    println(solve(a))
end

function solve(a)
    # dp[0] = 何も選ばない
    # dp[1] = 0番目までの整数の中から総和を取ったときの最大値
    # dp[2] = 1番目までの整数の中から総和を取ったときの最大値
    # dp[3] = ...
    #
    # dp[i] をもとに、dp[i+1]を計算する
    # dp[i+1] = max(dp[i], dp[i] + a[i])
    # dp[0] = 0
    n = length(a)
    dp = Vector{Int}(repeat([0], n+1))
    for i in 1:n
        dp[i+1] = max(dp[i], dp[i] + a[i])
    end
    return dp[n+1]
end

main()
