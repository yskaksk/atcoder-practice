function main()
    N = readline() |> x -> parse(Int, x)
    h = readline() |> split .|> x -> parse(Int, x)
    solve(N, h) |> println
end

function solve(N, h)
    # dp[i] : iにたどり着くまでに支払うコストの最小値
    #
    # dp[i] = min(dp[i-1] + |h_i - h_i-1|, dp[i-2] + |h_i - h_i-2|) if i > 2
    # dp[i] = dp[i-1] + |h_i - h_i-1|                               if i == 2
    # dp[i] = 0                                                     if i = 1
    dp = zeros(Int, N)
    dp[2] = abs(h[2] - h[1])
    for i in 3:N
        dp[i] = min(dp[i-1] + abs(h[i] - h[i-1]), dp[i-2] + abs(h[i] - h[i-2]))
    end
    return dp[N]
end

main()
