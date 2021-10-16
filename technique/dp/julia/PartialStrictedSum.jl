# n 種類の正の整数 a[0],a[1],…,a[n−1] がそれぞれ m[i] 個ずつある。
# また、正の整数 A が与えられる。これらの整数からいくつか選んで総和が
# A になるようにすることが可能か判定せよ。
#
# 可能ならば "YES" と出力し、不可能ならば "NO" と出力せよ。

include("./DP.jl")

function main()
    (N, A) = readline() |> split .|> x -> parse(Int, x)
    values = readline() |> split .|> x -> parse(Int, x)
    ms = readline() |> split .|> x -> parse(Int, x)

    solve(A, values, ms) |> println
end

function solve(A, values, ms)
    # dp[i][a] : i番目の数までで、a_iの個数が最も少なくなるようにaを作るとき余るa_iの個数。作れないときは-1
    #
    # dp[i][a]
    # - i-1まででaが作れる  → a_iは使わなくて良い → mi
    # - dp[i][a-a_i]が1以上 → もう一個使えば良い  → dp[i][a-a_i] - 1
    # - それ以外            → 作れない            → -1
    #
    # dp[i][a] = mi               if dp[i-1][a] >= 0
    # dp[i][a] = dp[i][a-a_i] - 1 if a >= a_i and dp[i][a-a_i] >= 1
    # dp[i][a] = -1               otherwise
    #
    # dp[0][a] = -1
    # dp[0][0] = 0

    N = length(values)
    dp = DP(N+1, A+1)
    for a in 1:A
        dp[0, a] = -1
    end
    for i in 1:N
        a_i = values[i]
        for a in 0:A
            if dp[i-1, a] >= 0
                dp[i, a] = ms[i]
            elseif a >= a_i && dp[i, a - a_i] >= 1
                dp[i, a] = dp[i, a - a_i] - 1
            else
                dp[i, a] = -1
            end
        end
    end
    r = dp[N, A]
    r >= 0 && return "YES"
    return "NO"
end

main()
