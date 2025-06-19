import functools

COINS = {1, 2, 5, 10, 20, 50, 100, 200}

total_calls = 0

@functools.cache
def make_change(amount, preceding_coin):
    global total_calls
    total_calls += 1

    if amount == 0:
        return 1
    elif amount < 0:
        return 0

    viable_coins = filter(lambda c: c <= preceding_coin, COINS)
    return sum(make_change(amount - c, c) for c in viable_coins)


total_permutations = make_change(200, 200)
print(f"Total permutations: {total_permutations}")
print(f"Calculating in {total_calls} total function calls.")