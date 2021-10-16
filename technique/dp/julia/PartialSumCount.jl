# n 個の正の整数 a[0],a[1],…,a[n−1] と正の整数 A が与えられる。
# これらの整数から何個かの整数を選んで総和が A になるようにする方法が何通りあるかを求めよ。
# ただし、答えがとても大きくなる可能性があるので、1,000,000,009 で割った余りで出力せよ。

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
    # dp[i][a] : i番目の数までで、和をaにする場合の数(i = 1 ~ N)
    #
    # 更新式
    # dp[i+1][a] = dp[i][a-a_i] + dp[i][a] if a >= a_i
    # dp[i+1][a] =                dp[i][a] if a <  a_i
    #
    # 初期条件
    # dp[0][a] = 0
    # dp[0][0] = 1
    #
    # return dp[N][A]

    mod = Int(1e9 + 9)

    N = length(values)
    dp = DP(N+1, A+1)
    dp[0, 0] = 1

    for i in 1:N
        a_i = values[i]
        for a in 0:A
            if a >= a_i
                dp[i, a] = (dp[i-1, a-a_i] + dp[i-1, a]) % mod
            else
                dp[i, a] = (dp[i-1, a]) % mod
            end
        end
    end
    return dp[N, A]
end

main()
