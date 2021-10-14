function main()
    N, A = readline() |> split .|> x -> parse(Int, x)
    X = readline() |> split .|> x -> parse(Int, x)
    r = solve(X, A)
    println(r)
end

function solve(X, A)
    x = max(A, X...)
    n = length(X)
    dp = Array{Int, 2}(undef, n+1, 2*n*x+1)
    X .-= A
    for j in 0:n, t in 0:2*n*x
        if j == 0 && t == n*x
            dp[j+1, t+1] = 1
        elseif j == 0
            dp[j+1, t+1] = 0
        elseif t - X[j] < 0 || t - X[j] > 2*n*x
            dp[j+1, t+1] = dp[j, t+1]
        else
            dp[j+1, t+1] = dp[j, t+1] + dp[j, t-X[j]+1]
        end
    end
    return dp[n+1, n*x+1]-1
end

main()
