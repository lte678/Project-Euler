use std::time::Instant;
use std::collections::HashMap;

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
    // Maps seed to known sequence length
    let mut cache = HashMap::<u64, usize>::new();
    let mut max_length: usize = 0;
    let mut max_seed: u64 = 0;
    for seed in 1..MAX_SEED {
        let mut seq_length: usize = 1;
        for n in Collatz::new(seed) {
            if n > seed {
                // Avoid the expensive hashtable lookup when we know the number wont be in there ^^
                seq_length += 1
            } else {
                match cache.get(&n) {
                    Some(len) => { seq_length = seq_length + *len; break; },
                    None => seq_length += 1,
                }
            }
        }
        cache.insert(seed, seq_length);
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