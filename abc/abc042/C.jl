# https://atcoder.jp/contests/abc042/tasks/arc058_a

to_int(x) = parse(Int, x)

function main()
    N, _ = readline() |> split .|> to_int
    D = readline() |> split .|> to_int
    r = solve(N, D)
    print(r)
end

function islike(n, D)
    for k in floor(Int, log10(n)):-1:0
        in(n ÷ 10^k, D) && return false
        n = n % 10^k
    end
    return true
end

function solve(N, D)
    K = floor(Int, log10(N))
    for n in N:10*N
        islike(n, D) && return n
    end
end

main()
