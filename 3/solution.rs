// This is a very bare bones rust project.
// To run it, just do `rustc solution.rs && ./solution`

fn prime_factors(n: u64) -> Vec<u64> {
    for i in 2..n/2 {
        if n % i == 0 {
            let mut factors = prime_factors(n / i);
            factors.push(i);
            return factors;
        }
    }
    vec![n]
}

fn main() {
    let number: u64 = 600851475143;
    let factors = prime_factors(number);
    println!("Prime factors of {number} are {:?}", factors);
    println!("The largest prime factor is {}", factors.iter().max().unwrap());
}