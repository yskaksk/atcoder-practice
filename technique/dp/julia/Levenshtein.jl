include("./DP.jl")

# 2つの文字列 S, T が与えられます。
# S に以下の3種類の操作のいずれかを順次実施して T に変換したいです。そのような一連の操作のうち、操作回数の最小値を求めよ。
#
# (操作)
# ＜変更＞ Sの中から文字S[i]を1個選んで、その文字を好きな文字に変更します。
# ＜削除＞ Sの中から文字S[i]を1個選んで、その文字を削除します。
# ＜挿入＞ Sの好きな箇所に好きな文字を挿入します。

function main()
    S = readline()
    T = readline()
    solve(S, T) |> println
end

function solve(S, T)
    # dp[i][j] : Sのi文字目までをTのj文字目までに変換するための最小回数
    #
    # dp[i][j]
    # - dp[i-1][j-1]     if S[i] == T[j]
    # - dp[i-1][j-1] +1  if S[j] != T[j]
    #
    # - dp[i][j-1] + 1
    # - dp[i-1][j] + 1
    #
    # dp[0][0] = 0

    S_l = length(S)
    T_l = length(T)
    dp = DP(S_l+1, T_l+1)

    for i in 1:S_l
        dp[i, 0] = i
    end
    for j in 1:T_l
        dp[0, j] = j
    end

    for i in 1:S_l
        for j in 1:T_l
            dp[i, j] = min(dp[i-1, j-1] + Int(S[i] != T[j]), dp[i-1, j] + 1, dp[i, j-1] + 1)
        end
    end
    return dp[S_l, T_l]
end

main()
