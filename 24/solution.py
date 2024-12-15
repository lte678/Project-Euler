from math import factorial


def solve(options: list[int], target_permutation):
    # We will mutate options
    options = options.copy()
    sol = []
    # Tracks the base permutation index that all remaining permutations increment from
    # e.g, once selecting 2 as the first digit, the base index would be 2 * 9!. 
    permutation_index = 0
    while options:
        # The permutation index is not dependent on the actual number, but rather it's index
        permutation_stride = factorial(len(options) - 1)
        next_digit_i = (target_permutation - permutation_index) // permutation_stride
        sol.append(options.pop(next_digit_i))
        permutation_index += next_digit_i * permutation_stride
    return sol



if __name__ == '__main__':
    sol = solve(
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
        999999
    )
    print(f'The millionth lexographic permutation of 0123456789 is {sol}')