const BASE2_10 = log2(10.0)


function solve(exp_2)
    digit_count = convert(Int64, floor(exp_2 / BASE2_10))
    println("Expected digits = $digit_count")

    digit_sum = 0
    for i in digit_count:-1:0
        exp2_digit = exp_2 - BASE2_10 * i
        digit = 2.0^exp2_digit
        digit_floor = floor(digit)
        exp_2 = log2(digit - digit_floor) + BASE2_10 * i
        # println("Digit: $digit_floor")
        digit_sum += digit_floor
    end
    println("The sum is $digit_sum")
end

solve(15.0)