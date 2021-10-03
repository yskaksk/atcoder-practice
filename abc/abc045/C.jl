function main()
    S = readline()
    r = 0
    n = length(S)
    for (i, s) in enumerate(S)
        si = parse(Int, s)
        for j in 1:(n-i+1)
            b = 10^(j-1)
            left = 2^(i-1)
            right = if i + j - 1 == n
                1
            else
                2^(n-i-j)
            end
            r += si * b * left * right
        end
    end
    print(r)
end

main()
