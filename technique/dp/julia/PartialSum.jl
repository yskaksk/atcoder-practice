# n 個の正の整数 a[0],a[1],…,a[n−1] と正の整数 A が与えられる。
# これらの整数から何個かの整数を選んで総和が A になるようにすることが可能か判定せよ。
# 可能ならば "YES" と出力し、不可能ならば "NO" と出力せよ。

Base.@kwdef struct DP
    matrix
end

function Base.getindex(dp::DP, i::Int, j::Int)
    return dp.matrix[i+1, j+1]
end

function Base.setindex!(dp::DP, X, i::Int, j::Int)
    dp.matrix[i+1, j+1] = X
end

function DP(N, M)
    return DP(matrix=falses(N, M))
end

function main()
    A = readline() |> x -> parse(Int, x)
    An = readline() |> split .|> x -> parse(Int, x)
    solve(A, An) |> println
end

function solve(A, An)
    # dp[i+1][a] : i番目までの数でaにできるかどうか
    #
    # dp[i+1][a] = dp[i][a-a[i]] || dp[i][a] if a >= a[i]
    # dp[i+1][a] = dp[i][a]                  if a < a[i]
    #
    # dp[0][a] = false
    # dp[0][0] = true
    #
    # dp[N][A] : N番目の数まででAにできるかどうか

    N = length(An)
    dp = DP(N+2, A+1)

    dp[0, 0] = true

    for i in 0:N
        if i == 0
            a_i = 0
        else
            a_i = An[i]
        end
        for a in 0:A
            if a >= a_i
                dp[i+1, a] = dp[i, a-a_i] || dp[i, a]
            else
                dp[i+1, a] = dp[i, a]
            end
        end
    end
    return dp[N+1, A]
end

main()
