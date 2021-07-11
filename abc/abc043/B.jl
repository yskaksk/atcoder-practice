function main()
    S = readline()
    r = ""
    for s in S
        if s == '0'
            r = r * "0"
        elseif s == '1'
            r = r * "1"
        elseif r != ""
            r = r[1:end-1]
        end
    end
    print(r)
end
main()
