def find_cycle(numerator, denominator):
    digits = []
    division_parts = []

    while numerator not in division_parts:
        division_parts.append(numerator)
        digit, carry = divmod(numerator, denominator)
        digits.append(digit)
        numerator = carry * 10
        if numerator == 0:
            return []
    
    start_of_cycle = division_parts.index(numerator)
    return digits[start_of_cycle:]

cycle_lengths = {n: len(find_cycle(1, n)) for n in range(1, 1000)}
longest_cycle_n = max(cycle_lengths, key=cycle_lengths.get)
print(f"Longest cycle has length {cycle_lengths[longest_cycle_n]} for 1/{longest_cycle_n}")