def prime_factors(n):
    factors = []
    for i in range(2, n + 1):
        while n % i == 0:
            factors.append(i)
            n = n // i
            if n == 1:
                return factors
    return factors


factor_count = {}
for i in range(2, 20):
    factors_i = prime_factors(i)
    factor_count_i = {}
    for factor in factors_i:
        factor_count_i.setdefault(factor, 0)
        factor_count_i[factor] += 1
    for fac, count in factor_count_i.items():
        factor_count.setdefault(fac, 0)
        factor_count[fac] = max(factor_count[fac], count)

print(factor_count)
prod = 1
for fac, count in factor_count.items():
    prod *= fac**count

print(f'The smallest multiple of all numbers from 1 to 20 is {prod}')