limit = 1000
# Do not include 0. Do not include the limit itself.
multiples3 = (limit - 1) ÷ 3
multiples5 = (limit - 1) ÷ 5
# Remove common factors
multiples15 = (limit - 1) ÷ 15

# Now we need to calculate the sum of the sequence 3, 6, 9, etc. and analog for the fives
sum3 = 3 * multiples3 * (multiples3 + 1) * 0.5
sum5 = 5 * multiples5 * (multiples5 + 1) * 0.5
sum15 = 15 * multiples15 * (multiples15 + 1) * 0.5
# Remove sum15, since these terms are present twice through sum3 AND sum5
sum = sum3 + sum5 - sum15

print("The sum is $sum")