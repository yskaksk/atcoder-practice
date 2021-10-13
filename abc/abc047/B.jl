function main()
    (W, H, N) = readline() |> split .|> x -> parse(Int, x)
    left_down = (0, 0)
    right_top = (W, H)
    for _ in 1:N
        (x, y, a) = readline() |> split .|> x -> parse(Int, x)
        if a == 1
            left_down = (max(x, left_down[1]), left_down[2])
        elseif a == 2
            right_top = (min(x, right_top[1]), right_top[2])
        elseif a == 3
            left_down = (left_down[1], max(y, left_down[2]))
        elseif a == 4
            right_top = (right_top[1], min(y, right_top[2]))
        end
    end
    w = max(right_top[1] - left_down[1], 0)
    h = max(right_top[2] - left_down[2], 0)
    println(w * h)
end

main()
