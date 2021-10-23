function main()
    (N, K) = readline() |> split .|> x -> parse(Int, x)
    h = readline() |> split .|> x -> parse(Int, x)
    solve(N, K, h) |> println
end

function solve(N, K, h)
    # dp[i] : iにたどり着くまでに支払うコストの最小値
    #
    # dp[i] = min(dp[i-1] + |h_i - h_i-1|, dp[i-2] + |h_i - h_i-2|) if i > 2
    # dp[i] = dp[i-1] + |h_i - h_i-1|                               if i == 2
    # dp[i] = 0                                                     if i = 1
    dp = zeros(Int, N)
    for i in 2:N
        m = Inf
        for k in 1:K
            if i == k
                break
            end
            m = min(m, dp[i-k] + abs(h[i] - h[i-k]))
        end
        dp[i] = m
    end
    return dp[N]
end

main()

