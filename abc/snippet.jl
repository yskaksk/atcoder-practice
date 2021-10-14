to_int(x) = parse(Int, x)
ndigit(n, k) = (n ÷ 10^(floor(Int, log10(n)) - k + 1)) % 10

function main()
    N = readline() |> split .|> to_int
end

main()
