function main()
    S = readline()
    a, b = solve(S)
    println("$a $b")
end

function solve(S)
    n = length(S)
    if n == 2
        S[1] == S[2] && return (1, 2)
        return (-1, -1)
    end
    for i in 1:n-2
        s1 = S[i]
        s2 = S[i+1]
        s3 = S[i+2]
        if s1 == s2
            return (i, i+1)
        elseif s2 == s3
            return (i+1, i+2)
        elseif s1 == s3
            return (i, i+2)
        else
            continue
        end
    end
    return (-1, -1)
end

main()
