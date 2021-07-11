# https://atcoder.jp/contests/abc042/tasks/arc058_b

function main()
    H, W, A, B = readline() |> split .|> x -> parse(Int, x)
    solve(H, W, A, B) |> print
end

function factorial(n::Int, mod::Int)::Vector{Int}
    r = repeat([1], n+1)
    for _n in 1:n
        r[_n+1] = (r[_n] * _n) % mod
    end
    return r
end

function comb(n::Int, r::Int, fact_n::Array{Int}, inv_n::Array{Int}, mod::Int)::Int
    res = (fact_n[n+1] * inv_n[r+1]) % mod
    res = (res * inv_n[n-r+1]) % mod
    return res
end

function solve(H::Int, W::Int, A::Int, B::Int)::Int
    mod = 10^9 + 7
    fact_n = factorial(W + H, mod)
    inv_n = [invmod(f, mod) for f in fact_n]
    r = 0
    for i in 1:W-B
        r += comb(H-A+B+i-2, H-A-1, fact_n, inv_n, mod) * comb(A+W-B-i-1, A-1, fact_n, inv_n, mod)
        r = r % mod
    end
    return r
end

main()
