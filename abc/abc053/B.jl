function main()
    s = readline()
    A = findfirst(x -> x == 'A', s)
    Z = findlast(x -> x == 'Z', s)
    println(Z - A + 1)
end

main()
