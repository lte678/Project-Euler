use std::time::Instant;

struct Collatz {
    n: u64,
}

impl Collatz {
    fn new(n: u64) -> Collatz {
        Collatz{n}
    }
}

impl Iterator for Collatz {
    type Item = u64;

    fn next(&mut self) -> Option<Self::Item> {
        if self.n == 1 {
            return None;
        } else if self.n % 2 == 0 {
            self.n /= 2;
        } else {
            self.n = 3 * self.n + 1;
        }
        Some(self.n)
    }
}


fn main() {
    let now = Instant::now();

    const MAX_SEED: u64 = 1_000_000;
    let mut max_length: usize = 0;
    let mut max_seed: u64 = 0;
    for seed in 1..MAX_SEED {
        let seq_length = Collatz::new(seed).count() + 1;
        if seq_length > max_length {
            max_length = seq_length;
            max_seed = seed;
            println!("New record: {} tokens for seed {}", max_length, max_seed);
        }
    }
    println!("The maximum sequence length is {} for starting seed {}", max_length, max_seed);
    let elapsed = now.elapsed();
    println!("Ran in {}ms", elapsed.as_millis());
}