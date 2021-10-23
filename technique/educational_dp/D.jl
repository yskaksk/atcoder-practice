#Base.@kwdef struct DP
#    matrix
#end
#Base.getindex(dp::DP, i::Int, j::Int) = dp.matrix[i+1, j+1]
#Base.setindex!(dp::DP, X, i::Int, j::Int) = dp.matrix[i+1, j+1] = X
#DP(N, M) = DP(matrix=zeros(Int, N, M))

function main()
    (N, W) = readline() |> split .|> x -> parse(Int, x)
    wv = [readline() |> split .|> x -> parse(Int, x) for _ in 1:N]
    solve(N, W, wv) |> println
end

function solve(N, W, wv)
    # dp[i, w] : i番目の品物をw以下で持ち帰るときの価値の最大
    #
    # dp[i, w] = max(dp[i-1, w-w_i] + v_i, dp[i-1, w]) if w >= w_i
    # dp[i, w] = dp[i-1, w]                            if w <  w_i
    #
    # dp[0, w] = 0

    #dp = DP(N+1, W+1)
    dp = zeros(Int, N+1, W+1)

    for i in 1:N
        for w in 1:W
            (w_i, v_i) = wv[i]
            if w >= w_i
                #dp[i, w] = max(dp[i-1, w-w_i] + v_i, dp[i-1, w])
                dp[i+1, w+1] = max(dp[i, w-w_i+1] + v_i, dp[i, w+1])
            else
                #dp[i, w] = dp[i-1, w]
                dp[i+1, w+1] = dp[i, w+1]
            end
        end
    end
    return dp[N+1, W+1]
end

main()
