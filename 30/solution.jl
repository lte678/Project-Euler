# The maximum number that could be represented by the fifth power of its digits
# is 413343 for 9^5 * 7 seven digits, but that is only six digits, thus it is
# impossible to represent seven digit numbers this way.
# By 9^5 * 6 = 354294, we can see that six digits are sufficient.


# The digits should be in reverse order, like that returned from digits(...)
test_number(digits) = sum(map((x) -> x^5, digits)) == evalpoly(10, digits)

# Anything with a single digit is not a sum.
sol_numbers = filter((x) -> test_number(digits(x)), 10:(9^5 * 6))
println("Solutions: $sol_numbers")
println("Sum: $(sum(sol_numbers))")
