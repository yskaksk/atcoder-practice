function main()
    N = readline() |> x -> parse(Int, x)
    happiness = [readline() |> split .|> x -> parse(Int, x) for _ in 1:N]
    solve(N, happiness) |> println
end

function solve(N, happiness)
    # dp[i][x] : i日目に活動xを行ったときの幸福度の最大値
    #
    # dp[i][a] = max(dp[i-1][b], dp[i-1][c]) + a_i
    # ...
    #
    # dp[0][x] = 0
    dp = zeros(Int, N, 3)
    dp[1, 1] = happiness[1][1]
    dp[1, 2] = happiness[1][2]
    dp[1, 3] = happiness[1][3]

    for i in 2:N
        h = happiness[i]
        dp[i, 1] = max(dp[i-1, 2], dp[i-1, 3]) + h[1]
        dp[i, 2] = max(dp[i-1, 1], dp[i-1, 3]) + h[2]
        dp[i, 3] = max(dp[i-1, 1], dp[i-1, 2]) + h[3]
    end
    return max(dp[N, 1], dp[N, 2], dp[N, 3])
end

main()
