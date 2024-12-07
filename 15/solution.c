// This can be solved with "stars and bars"
// See https://en.wikipedia.org/wiki/Stars_and_bars_(combinatorics)
// Basically, we divide the movement into A and B direction and treat each potential point to go into B direction
// as a bin. Thus there are 21 bins and 20 moves to put into it for a 20x20 grid.


#include <stdio.h>
#include <stdlib.h>


unsigned long factorial(unsigned long n) {
    if(n == 1) {
        return 1;
    }
    return factorial(n-1) * n;
}


unsigned long binomial(unsigned long n, unsigned long k) {
    // We have to avoid the insane overflows here, for example from 40 factorial.
    unsigned long *divisors = malloc((n - k) * sizeof(unsigned long));
    int n_divisors = n - k;
    for(int i = 0; i < n_divisors; i++) {
        divisors[i] = i + 1;
    }

    unsigned long ret = 1;
    for (unsigned long n_i = n; n_i > k; n_i--) {
        ret *= n_i;
        for(unsigned int i = 0; i < n_divisors; i++) {
            if(ret % divisors[i] == 0) {
                ret /= divisors[i];
                for(unsigned int j = i; j < n_divisors - 1; j++) {
                    divisors[j] = divisors[j + 1];
                }
                n_divisors--;
                i--;
                // Stay at the same index, since we just modified the array
            }
        }
    }
    return ret;
}

int main() {
    printf("There are %lu permutations\n", binomial(40, 20));
    return 0;
}