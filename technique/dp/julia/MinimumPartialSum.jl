# n 個の正の整数 a[0],a[1],…,a[n−1] と正の整数 A が与えられる。
# これらの整数から何個かの整数を選んで総和が AA にする方法をすべて考えた時、
# 選ぶ整数の個数の最小値を求めよ。
#
# A にすることができない場合は -1 と出力せよ。

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
    A = readline() |> x -> parse(Int, x)
    values = readline() |> split .|> x -> parse(Int, x)

    solve(A, values) |> println
end

function solve(A, values)
    # dp[i][a] : i番目の数まででaを作る方法のうち個数が最小になるもの
    # dp[N][A] : もとめるもの
    #
    # 更新式
    # dp[i][a] = min(dp[i-1][a-a_i] + 1, dp[i-1][a]) if a >= a_i
    # dp[i][a] = dp[i-1][a]                          if a < a_i
    #
    # 初期条件
    # dp[0][a] = N+1(inf)
    # dp[0][0] = 0
    N = length(values)
    dp = DP(N+1, A+1)

    for a in 1:A
        dp[0, a] = N+1
    end
    dp[0, 0] = 0

    for i in 1:N
        a_i = values[i]
        for a in 0:A
            if a >= a_i
                dp[i, a] = min(dp[i-1, a-a_i] + 1, dp[i-1, a])
            else
                dp[i, a] = dp[i-1, a]
            end
        end
    end
    r = dp[N, A]
    r <= N && return r
    return -1
end

main()
