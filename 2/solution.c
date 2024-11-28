#include "stdio.h"

const int CUTOFF = 4000000;


void main() {
    // These are the two active fibonacci terms.
    int a = 1;
    int b = 2;

    int sum = 0;
    while(a <= CUTOFF) {
        if(a % 2 == 0) {
            sum += a;
        }
        int next = a + b;
        a = b;
        b = next;
    }
    printf("The sum is %i\n", sum);
}