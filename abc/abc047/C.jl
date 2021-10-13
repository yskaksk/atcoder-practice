function main()
    S = readline()
    current = S[1]
    count = 0
    for c in S
        if c != current
            current = c
            count += 1
        end
    end
    println(count)
end

main()
