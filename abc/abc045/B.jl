function main()
    Sa = readline()
    Sb = readline()
    Sc = readline()

    now = 'a'
    while true
        if now == 'a'
            if length(Sa) == 0
                print("A")
                break
            end
            now = Sa[1]
            Sa = Sa[2:end]
        elseif now == 'b'
            if length(Sb) == 0
                print("B")
                break
            end
            now = Sb[1]
            Sb = Sb[2:end]
        else
            if length(Sc) == 0
                print("C")
                break
            end
            now = Sc[1]
            Sc = Sc[2:end]
        end
    end
end


main()
