/// Extended from problem 7
fn is_prime(n: i64) -> bool {
    if n <= 1 {
        return false;
    }
    let mut i = 2;
    while i*i <= n {
        if n % i == 0 {
            return false
        }
        i += 1;
    }
    true
}


fn test_number_of_primes(a: i64, b: i64) -> i64 {
    for n in 0.. {
        if !is_prime(n*n + a*n + b) {
            return n;
        }
    }
    return 0
}


fn main() {
    let mut most_primes = 0;
    for a in -999..=999 {
        for b in -1000..=1000 {
            if a == 0 || b == 0 {
                continue;
            }
            let n_primes = test_number_of_primes(a, b);
            if n_primes > most_primes {
                most_primes = n_primes;
                println!("Most primes is {} for a={} and b={}.", n_primes, a, b);
            }
        }
    }
}