const IN_DIGITS = 50
const DIGITS = 10

function solve()
    prob = read("problem.txt", String)
    numbers = length(split(prob))

    # Each number in the sum contributes an error the same magnitude as the least significant digit.
    # Thus, the cumulative sum of the errors must be less than the significance of the 10. digit to achieve the desired
    # resolution.
    # 1/10^min_n = max term error = 1/numbers
    min_n = convert(UInt, ceil(log10(numbers)))
    req_digits = DIGITS + min_n

    println("Evaluating $req_digits out of $IN_DIGITS digits.")

    # msd := Most significant digits
    sum_msd = 0
    for n_str in eachsplit(prob)
        n_msd = parse(UInt64, n_str[begin:req_digits])
        sum_msd += n_msd
    end
    sum_str = string(sum_msd)[begin:DIGITS]
    println("The first ten digits of the sum are $sum_str")
end

solve()