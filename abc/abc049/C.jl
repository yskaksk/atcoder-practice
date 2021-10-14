function main()
    S = readline()
    while length(S) > 0
        if endswith(S, "dream")
            S = S[1:end-5]
        elseif endswith(S, "dreamer")
            S = S[1:end-7]
        elseif endswith(S, "erase")
            S = S[1:end-5]
        elseif endswith(S, "eraser")
            S = S[1:end-6]
        else
            println("NO")
            return
        end
    end
    println("YES")
end


main()
