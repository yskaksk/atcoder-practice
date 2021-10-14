function main()
    w = readline()
    d = Dict{Char, Int}()
    for s in w
        if s in keys(d)
            d[s] += 1
        else
            d[s] = 1
        end
    end
    for v in values(d)
        if v % 2 == 1
            print("No")
            return
        end
    end
    print("Yes")
end

main()
