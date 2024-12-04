function next_prime(prev)
    if prev == 0
        return 2
    elseif prev == 2
        return 3
    end

    while true
        prev += 2
        prime = true
        for i = 2:floor(sqrt(prev))
            if prev % i == 0
                prime = false
                break
            end
        end
        if prime
            return prev
        end
    end
end

function sum_primes()
    prime_sum = 0
    n = 0
    while n < 2000000
        prime_sum += n
        n = next_prime(n)
    end
    return prime_sum
end


psum = sum_primes()
print("The sum of primes under 2000000 is $psum")