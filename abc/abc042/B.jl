# https://atcoder.jp/contests/abc042/tasks/abc042_b

to_int(x) = parse(Int, x)

function solve(S)
    sort!(S)
    return join(S)
end

function main()
    N, L = readline() |> split .|> to_int
    S = [readline() for _ in 1:N]
    r = solve(S)
    print(r)
end

main()
