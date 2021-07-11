# https://atcoder.jp/contests/abc042/tasks/abc042_a

to_int(x) = parse(Int, x)

function main()
    A, B, C = readline() |> split .|> to_int
    r = if (A == 5 && B == 5 && C == 7) || (A == 5 && B == 7 && C == 5) || (A == 7 && B == 5 && C == 5)
        "YES"
    else
        "NO"
    end
    print(r)
end

main()
