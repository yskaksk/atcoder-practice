include("./DP.jl")

# 2つの文字列 S, T が与えられる。"abcde" といった文字列の部分文字列とは、
# "a", "ad", "abe" といったように、文字列から文字を幾つか抜き出して
# 順に繋げてできる文字列のことを言うものとする。
# このとき、S と T の共通の部分文字列となる文字列の長さの最大値を求めよ。

function main()
    S = readline()
    T = readline()
    solve(S, T) |> println
end

function solve(S, T)
    # dp[i][j] : Sのi文字目までとTのj文字目まででのLCSの長さ
    #
    # dp[i][j] = max(dp[i][j] + 1, dp[i][j-1], dp[i-1][j]) if S[i] == T[j]
    # dp[i][j] = max(dp[i][j], dp[i][j-1], dp[i-1][j])     otherwise
    #
    # dp[0][0] = 0

    S_l = length(S)
    T_l = length(T)

    dp = DP(S_l+1, T_l+1)
    for i in 1:S_l, j in 1:T_l
        f = Int(S[i] == T[j])
        dp[i, j] = max(dp[i-1, j-1] + f, dp[i, j-1], dp[i-1, j])
    end
    return dp[S_l, T_l]
end

main()
