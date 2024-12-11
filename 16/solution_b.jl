# Let's just do it brutally
# We will use little-endian order, so that we can append the carried digit to the next column

function multiply_digits!(digits, factor)
    carry = 0
    for i in eachindex(digits)
        raw_digit = digits[i] * factor + carry
        digits[i] = raw_digit % 10
        carry = (raw_digit - digits[i]) ÷ 10
    end
    if carry >= 10
        println("Carry for final digit is out of bounds!")
    end
    if carry != 0
        push!(digits, carry)
    end
    return digits
end

function solve()
    digits = [2]
    for i in 1:999
        multiply_digits!(digits, 2)
    end
    println("The sum of the digits is $(sum(digits))")
end

solve()