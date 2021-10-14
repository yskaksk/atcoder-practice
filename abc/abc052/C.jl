function main()
    N = readline() |> x -> parse(Int, x)
    mod = Int(1e9 + 7)
    if N == 1
        println(1)
        return
    end
    primes = find_primes(N)
    result = BigInt(1)
    for p in primes
        result *= BigInt(n_f(N, p) + 1)
        result %= mod
    end
    println(result)
end

function find_primes(N)
    primes = [2]
    for cand in 3:2:N
        is_prime = true
        for p in primes
            if cand % p == 0
                is_prime = false
                break
            end
        end
        if is_prime
            primes = [primes; [cand]]
        end
    end
    return primes
end

function n_f(N, prime)
    r = 0
    divisor = prime
    while divisor <= N
        r += floor(Int, N / divisor)
        divisor *= prime
    end
    return r
end

main()
