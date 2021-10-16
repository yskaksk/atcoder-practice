# n 個の品物があり、i 番目の品物のそれぞれ重さと価値が
#
# weight[i],value[i] となっている (i=0,1,...,n−1)
#
# これらの品物から重さの総和が W を超えないように選んだときの、価値の総和の最大値を求めよ。

function main()
    (N, W) = readline() |> split .|> x -> parse(Int, x)
    items = [readline() |> split .|> x -> parse(Int, x) for _ in 1:N]
    println(solve(N, W, items))
end

function solve(N, W, items)
    # dp[i][w] : i番目までの品物の中から重さがwを超えないように選んだときの価値の総和の最大値
    #
    # dp[i+1][w] = max(dp[i][w], dp[i][w-weight[i+1]] + value[i+1])
    # dp[0][w] = 0 for all w
    dp = zeros(Int64, N+1, W+1)
    for i in 1:N
        for w in 0:W
            if items[i][1] <= w
                dp[i+1, w+1] = max(dp[i, w+1], dp[i, w+1-items[i][1]] + items[i][2])
            else
                dp[i+1, w+1] = dp[i, w+1]
            end
        end
    end
    return dp[N+1, W+1]
end

main()
