# n 個の正の整数 a[0],a[1],…,a[n−1] と正の整数 A が与えられる。
# これらの整数から K 個以内の整数を選んで総和が A になるようにすることが可能か判定せよ。
# 可能ならば "YES" と出力し、不可能ならば "NO" と出力せよ。

Base.@kwdef struct DP
    matrix
end

function Base.getindex(dp::DP, i::Int, j::Int)
    dp.matrix[i+1, j+1]
end

function Base.setindex!(dp::DP, X, i::Int, j::Int)
    dp.matrix[i+1, j+1] = X
end

function DP(N, M)
    return DP(matrix=zeros(Int, N, M))
end


function main()
    (N, K) = readline() |> split .|> x -> parse(Int, x)
    values = readline() |> split .|> x -> parse(Int, x)
    A = readline() |> x -> parse(Int, x)

    solve(K, A, values) |> println
end

function solve(K, A, values)
    # > 一般に bool 値を求める DP をすることは無駄であることが多く、同じ計算量でもっと多くのことを知ることができます。
    #
    # dp[i][a] : i番目の数までで総和をaとするときの個数の最小値
    #
    # 求めるもの
    # dp[N][A] -> >KならNO、<=KならYESを出力する
    #
    # 更新式
    # dp[i][a] = min(dp[i-1][a-a_i] + 1, dp[i-1][a])
    # dp[i][a] = dp[i-1][a]
    #
    # さっきと同じなので、割愛
end

main()
